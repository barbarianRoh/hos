$(function() {
  // 환영 메시지를 받으려면, 먼저 빈 값으로 서버에 요청하여 환영 메시지를 받은 뒤 메시지를 입력할 때까지 기다립니다.
  callAjax();

  // 질문을 물어보고 음성 응답을 받습니다 (text)
  $('#chatForm').on('submit', function(event) {
    event.preventDefault();
    if ($('#message').val() == "") {
      // 질문을 입력하지 않고 전송 버튼을 클릭하면 환영 메시지가 표시되는 것을 방지합니다.
      alert("질문을 입력해주세요.");
      return false;
    }
    if ($('#message').val() != "") {
      $('#chatBox').append('<div class="msgBox send"><span id="in"><span>' +
        $('#message').val() + '</span></span></div><br>');
    }
    callAjax();
    /* 필드 초기화 */
    $('#message').val('');
  }); // 전송 버튼 이벤트 종료

  // 별도의 ajax 함수를 생성합니다.
  function callAjax(postbackFullValue) {
    $.ajax({
      type: "post",
      url: "chatbotArtineer",
      data: {
        inputText: postbackFullValue || $('#message').val()
      },
      dataType: 'json',
      success: function(result) {
        if (result && result.bubbles && Array.isArray(result.bubbles)) {
          // JSON 형식으로 반환값을 받습니다.
          var bubbles = result.bubbles;
          for (var b in bubbles) {
            if (bubbles[b].type == 'text') { // 기본 답변일 경우
              /* 받은 메시지를 chatBox에 추가합니다. */
              $('#chatBox').append('<div class="msgBox receive"><span id="in"><span>챗봇</span><br><span>' +
                bubbles[b].data.description + '</span></span></div><br><br>');

              // 음성 변환을 위해 TTS를 호출합니다.
              callAjaxTTS(bubbles[b].data.description);
            } else if (bubbles[b].type == 'template') { // 이미지 응답 또는 다중 링크 응답
              if (bubbles[b].data.cover.type == "image") { // 이미지인 경우
                $("#chatBox").append("<img src='" + bubbles[b].data.cover.data.imageUrl +
                  "' alt='이미지 없음'>");
                if (bubbles[b].data.contentTable == null) {
                  $("#chatBox").append
                  ("<a href='" + bubbles[b].data.cover.data.action.data.url + "' target='_blank'>" +
                    bubbles[b].data.cover.data.action.data.url + "</a><br>");
                } else {
                  $("#chatBox").append("<div class=\"msgBox receive\"><span id=\"in\"><span>챗봇</span><br><span>" + bubbles[b].data.cover.data.description + "</p>");
                  // 음성 변환을 위해 TTS를 호출합니다.
                  callAjaxTTS(bubbles[b].data.cover.data.description);
                }
              } else if (bubbles[b].data.cover.type == "text") { // 다중 링크 응답인 경우
                $("#chatBox").append("<div class=\"msgBox receive\"><span id=\"in\"><span>챗봇</span><br><span>" + bubbles[b].data.cover.data.description + "</p>");
                // 음성 변환을 위해 TTS를 호출합니다.
                callAjaxTTS(bubbles[b].data.cover.data.description);
              }

              // 이미지 / 다중 링크 응답 공통 (contentTable 포함)
              for (var ct in bubbles[b].data.contentTable) {
                var ct_data = bubbles[b].data.contentTable[ct];
                for (var ct_d in ct_data) {
                  // 각 링크의 postback 값을 가져옵니다.
                  var postbackValue = ct_data[ct_d].data.data.action.data.postback;
                  var displayText = ct_data[ct_d].data.data.action.data.displayText;

                  // "displayText"를 링크 텍스트로 사용하여 링크를 생성합니다.
                  var link = $("<a></a>")
                    .attr("href", "#") // 링크를 클릭하면 페이지가 리디렉션되지 않도록 "#"를 사용합니다.
                    .data("postbackfull", ct_data[ct_d].data.data.action.data.postbackFull) // 전체 postback 값을 가져오기 위해 "postbackFull" 사용
                    .text(displayText); // "formName" 대신 "displayText"를 사용합니다.

                  // 링크를 chatBox에 추가합니다.
                  $("#chatBox").append(link).append("<br><br>");
                }
              } // contentTable for 문 종료
            } // template 종료
          } // bubbles for 문 종료

          // 스크롤 업
          $("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));
        } else {
          console.error('서버에서 잘못된 또는 비어있는 응답을 받았습니다.');
        }
      },
      error: function(data) {
        alert("오류가 발생했습니다.");
      }
    });
  }

  // chatBox 내부의 링크에 클릭 이벤트 리스너를 추가합니다.
  $("#chatBox").on("click", "a", function(event) {
    event.preventDefault(); // 링크의 기본 동작(링크 URL로 이동)을 방지합니다.

    // 데이터 속성을 사용하여 클릭한 링크의 "postbackfull" 값을 추출합니다.
    var postbackFullValue = $(this).data("postbackfull");

    // postbackFullValue를 기반으로 다음 대화로 이동하는 함수를 호출합니다.
    callAjax(postbackFullValue);
  });

  // TTS를 위해 ajax 함수를 호출합니다.
  function callAjaxTTS(result) {
    $.ajax({
      type: "post",
      url: "chatbotTTS",
      data: {
        inputText: result
      },
      dataType: 'text',
      success: function(result) {
        // 오디오 파일 이름을 받습니다.
      },
      error: function(data) {}
    });
  }
});
