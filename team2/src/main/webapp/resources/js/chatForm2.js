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
            url:"chatbotSend",
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