<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<script>
$(function(){
    // 웰컴메시지를 받기 위해 message 입력 받기 전 빈 값으로 서버에 전송해서 웰컴메세지 받음
    callAjax();
    ////////////////////////////////////////////////////////
    // 음성으로 질문하기
    const record = document.getElementById("record");
    const stop = document.getElementById("stop");
    const soundClips = document.getElementById("sound-clips");

    const audioCtx = new(window.AudioContext || window.webkitAudioContext)(); // 오디오 컨텍스트 정의

    if (navigator.mediaDevices) {
        var constraints = {
            audio: true
        }
        let chunks = [];

        navigator.mediaDevices.getUserMedia(constraints)
            .then(stream => {
                const  mediaRecorder = new MediaRecorder(stream);

                record.onclick = () => {
                    mediaRecorder.start();
                    record.style.background = "red";
                    record.style.color = "black";
                }

                stop.onclick = () => {//정지 버튼 클릭 시
                    mediaRecorder.stop();//녹음 정지
                    record.style.background = "";
                    record.style.color = "";
                }

                mediaRecorder.onstop = e => {

                    const clipName = "voiceMsg";
                    //태그 3개 생성
                    const clipContainer = document.createElement('article');
                    const audio = document.createElement('audio');
                    const a = document.createElement('a');

                    clipContainer.appendChild(a);
                    soundClips.appendChild(clipContainer);

                    //chunks에 저장된 녹음 데이터를 audio 양식으로 설정
                    //audio.controls = true;
                    const blob = new Blob(chunks, {
                        'type': 'audio/mp3 codecs=opus'
                    }) ;
                    chunks = [];
                    const audioURL = URL.createObjectURL(blob);
                    // audio.src = audioURL;
                    //blob:http://localhost:8011/6377d19d-2ca8-49b1-a37f-068d602ceb60
                    a.href=audioURL;
                    a.download = clipName;
                    //a.innerHTML = "DOWN"
                    a.click(); // 다운로드 폴더에 저장하도록 클릭 이벤트 발생

                    fileUpload(blob, clipName);

                }//mediaRecorder.onstop

                //녹음 시작시킨 상태가 되면 chunks에 녹음 데이터를 저장하라
                mediaRecorder.ondataavailable = e => {
                    chunks.push(e.data)
                }

            })
            .catch(err => {
                console.log('The following error occurred: ' + err)
            })
    }
    // 서버에 업로드
    function fileUpload(blob, clipName){

        var formData = new FormData();
        formData.append('uploadFile', blob, clipName+".mp3");

        //녹음된 mp3파일 전송하고 반환된 텍스트(result)를 챗봇 서버에 전달
        $.ajax({
            type:"post",
            enctype: 'multipart/form-data',
            url: "stt", //통신할 url
            data: formData, //전송할 데이타    : 파일명 :voiceMsg.mp3
            processData: false,
            contentType: false,
            success: function(result) {
                $('#chatBox').append('<div class="msgBox send"><span id="in"><span>' +
                    result + '</span></span></div><br>');
                // 챗봇에게 전달
                $('#message').val(result);
                callAjax();
                $('#message').val('');
            },
            error: function(e) {
                alert("에러가 발생했습니다 : " + e);
            }
        });
    }
    ////////////////////////////////////////////////////////
    // 질문하고 음답 받기(텍스트)
    $('#chatForm').on('submit', function(event) {
        event.preventDefault();
        if ($('#message').val() == "") {
            alert("Please enter a question");
            return false;
        }
        if ($('#message').val() != "") {
            $('#chatBox').append('<div class="msgBox send"><span id="in"><span>' +
                $('#message').val() + '</span></span></div><br>');
        }
        callAjax();
        /* Clear field */
        $('#message').val('');
    });

    function callAjax() {
        $.ajax({
            type: "post",
            url: "chatbotSend",
            data: {
                inputText: $('#message').val()
            },
            dataType: 'json',
            success: function(result) {
                /* Add received message to chatBox */
                $('#chatBox').append('<div class="msgBox receive"><span id="in"><span>챗봇</span><br><span>' +
                    result +'</span></span></div><br><br>');
                // scroll up
                $("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));
                
                var bubbles = result.bubbles;
                for (var b in bubbles) {
                    if (bubbles[b].type == 'text') {
                        var encodedMessage = encodeURIComponent(bubbles[b].data.description);
                        var decodedMessage = decodeURIComponent(encodedMessage);
                        $('#chatBox').append('<div class="msgBox receive"><span id="in"><span>Chatbot</span><br><span>' +
                            decodedMessage + '</span></span></div><br><br>');
                        callAjaxTTS(decodedMessage);
                    } else if (bubbles[b].type == 'template') {
                        if (bubbles[b].data.cover.type == "image") {
                            $("#chatBox").append("<img src='" + bubbles[b].data.cover.data.imageUrl +
                                "' alt='No Image'>");
                            if (bubbles[b].data.contentTable == null) {
                                $("#chatBox").append("<a href='" + bubbles[b].data.cover.data.action.data.url +
                                    "' target='_blank'>" + bubbles[b].data.cover.data.action.data.url + "</a><br>");
                            } else {
                                var encodedDescription = encodeURIComponent(bubbles[b].data.cover.data.description);
                                var decodedDescription = decodeURIComponent(encodedDescription);
                                $("#chatBox").append("<div class=\"msgBox receive\"><span id=\"in\"><span>Chatbot</span><br><span>" +
                                    decodedDescription + "</p>");
                                callAjaxTTS(decodedDescription);
                            }
                        } else if (bubbles[b].data.cover.type == "text") {
                            var encodedDescription = encodeURIComponent(bubbles[b].data.cover.data.description);
                            var decodedDescription = decodeURIComponent(encodedDescription);
                            $("#chatBox").append("<div class=\"msgBox receive\"><span id=\"in\"><span>Chatbot</span><br><span>" +
                                decodedDescription + "</p>");
                            callAjaxTTS(decodedDescription);
                        }

                        for (var ct in bubbles[b].data.contentTable) {
                            var ct_data = bubbles[ct].data.contentTable[ct];
                            for (var ct_d in ct_data) {
                                var encodedUrl = encodeURIComponent(ct_data[ct_d].data.data.action.data.url);
                                var decodedUrl = decodeURIComponent(encodedUrl);
                                $("#chatBox").append("<a href='" + decodedUrl + "' target='_blank'>" +
                                    decodedUrl + "</a><br>");
                            }
                        }
                    }
                }

                $("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));
            },
            error: function(data) {
                alert("An error has occurred");
            }
        });
    }

});



















































$(function(){
    // 웰컴메시지를 받기 위해 message 입력 받기 전 빈 값으로 서버에 전송해서 웰컴메세지 받음
    callAjax();
    $('#chatForm').on('submit', function(event){
        event.preventDefault();
        if($('#message').val() == "") { // 질문을 입력하지 않고 전송 버튼 누를 때 웰컴 메세지 뜨지 않게
            alert("질문을 입력하세요");
            return false;
        }
        if($('#message').val() != ""){
            $('#chatBox').append('<div class="msgBox send"><span id="in"><span>' +
                $('#message').val() + '</span></span></div><br>');
        }
        callAjax();
        /* 입력란 비우기*/
        $('#message').val('');
    }); // submit 끝
    // 별도의 ajax 생성
    function callAjax() {
        $.ajax({
            url:"chatbotSend2",
            type:"post",
            data:{inputText: $('#message').val()},
            success:function(result){
                /* chatBox에 받은 메시지 추가 */
                $('#chatBox').append('<div class="msgBox receive"><span id="in"><span>챗봇</span><br><span>' +
                    result +'</span></span></div><br><br>');
                // 스크롤해서 올리기
                $("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));
            },
            error:function(){
                alert("오류가 발생했습니다.")
            }
        });
    }
});
</script>