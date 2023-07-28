    $(function() {
      // 환영 메시지를 받기 위해 먼저 빈 값으로 서버에 요청하고, 환영 메시지를 받은 후 메시지 입력을 기다립니다.
      callAjax();

      // 질문을 하고 응답을 받습니다.
      $('#chatForm').on('submit', function(event) {
        event.preventDefault();
        if ($('#message').val() == "") {
          // 질문을 입력하지 않고 제출 버튼을 클릭했을 때 환영 메시지가 표시되는 것을 방지합니다.
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
      });

      // 별도의 ajax 함수를 만듭니다.
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
              // JSON 형식으로 반환된 값을 가져옵니다.
              var bubbles = result.bubbles;
              for (var b in bubbles) {
                if (bubbles[b].type == 'text') { // 기본 응답인 경우
                  /* 받은 메시지를 chatBox에 추가합니다. */
                  $('#chatBox').append('<div class="msgBox receive"><span id="in"><span>Chatbot</span><br><span>' +
                    bubbles[b].data.description + '</span></span></div><br><br>');

                  // 음성 변환을 위해 TTS 호출합니다.
                  callAjaxTTS(bubbles[b].data.description);
                } else if (bubbles[b].type == 'template') { // 이미지 응답 또는 다중 링크 응답인 경우
                  if (bubbles[b].data.cover.type == "image") { // 이미지인 경우
                    $("#chatBox").append("<img src='" + bubbles[b].data.cover.data.imageUrl +
                      "' alt='이미지 없음'>");
                    if (bubbles[b].data.contentTable == null) {
                      $("#chatBox").append("<a href='" + bubbles[b].data.cover.data.action.data.url + "' target='_blank'>" +
                        bubbles[b].data.cover.data.action.data.displayText + "</a><br>");
                    } else {
                      $("#chatBox").append("<div class=\"msgBox receive\"><span id=\"in\"><span>Chatbot</span><br><span>" + bubbles[ b].data.cover.data.description + "</p>");
                      // 음성 변환을 위해 TTS 호출합니다.
                      callAjaxTTS(bubbles[b].data.cover.data.description);
                    }
                  } else if (bubbles[b].data.cover.type == "text") { // 다중 링크 응답인 경우
                    $("#chatBox").append("<div class=\"msgBox receive\"><span id=\"in\"><span>Chatbot</span><br><span>" + bubbles[ b].data.cover.data.description + "</p>");
                    // 음성 변환을 위해 TTS 호출합니다.
                    callAjaxTTS(bubbles[b].data.cover.data.description);
                  }

                  // image/multilink 응답 공통 (contentTable과 함께)
                  for (var ct in bubbles[b].data.contentTable) {
                    var ct_data = bubbles[b].data.contentTable[ct];
                    for (var ct_d in ct_data) {
                      if (ct_data[ct_d].data.data.action.type === "postback") { // postback인 경우
                        var postbackValue = ct_data[ct_d].data.data.action.data.postback;
                        var displayText = ct_data[ct_d].data.data.action.data.displayText;

                        // "displayText"를 사용하여 버튼 생성합니다.
                        var button = $("<button></button>")
                          .attr("type", "button")
                          .data("postbackfull", ct_data[ct_d].data.data.action.data.postbackFull) // "postbackFull"을 사용하여 전체 postback 값을 가져옵니다.
                          .addClass("button-link") // 스타일링을 위해 "button-link" 클래스 추가합니다.
                          .text(displayText) // "formName" 대신 "displayText"를 사용합니다.
                          .click((function(displayText) {
                            // 클로저를 사용하여 각 클릭 핸들러에 "displayText" 값을 할당합니다.
                            return function() {
                              // 버튼이 클릭되면 해당 URL로 이동합니다.
                              var postbackValue = $(this).data("postbackfull");

                              // 사용자가 입력한 새 메시지 창에 "displayText"를 추가합니다.
                              var userMsgBox = $('<div class="msgBox send"><span id="in"><span>' + displayText + '</span></span></div><br><br>' );
                              $("#chatBox").append(userMsgBox);

                              // 음성 변환을 위해 TTS 호출합니다.
                              callAjaxTTS(displayText);

                              callAjax(postbackValue); // 새 질문을 출력합니다.
                              // window.location.href = postbackValue; // 이동 대신 새 질문을 출력하려면 이 줄을 주석 처리합니다.
                            };
                          })(displayText));

                        // 챗박스에 버튼을 추가합니다.
                        var msgBox = $('<div class="msgBox receive"></div>');
                        var buttonContainer = $('<span id="in"><span>Chatbot</span><br></span>');
                        buttonContainer.append(button).append('<br><br>');
                        msgBox.append(buttonContainer);
                        $("#chatBox").append(msgBox);
                      } else if (ct_data[ct_d].data.data.action.type === "link") { // link인 경우
                        var url = ct_data[ct_d].data.data.action.data.url;

                        // "url"을 사용하여 버튼 생성합니다.
                        var title = ct_data[ct_d].data.title;
                        var button = $("<button></button>")
                          .attr("type", "button")
                          .addClass("button-link") // 스타일링을 위해 "button-link" 클래스 추가합니다.
                          .text(title) // "displayText" 없이 일반 텍스트를 사용합니다.
                          .click((function(url) {
                            // 클로저를 사용하여 각 클릭 핸들러에 "url" 값을 할당합니다.
                            return function() {
                              // 버튼이 클릭되면 해당 URL로 이동합니다.
                              window.open(url, '_blank');

                              // 사용자가 입력한 새 메시지 창에 "이동하기"를 추가합니다.
                              
                              $("#chatBox").append(userMsgBox);

                              // 음성 변환을 위해 TTS 호출합니다.
                              callAjaxTTS(title);
                            };
                          })(url));

                        // 챗박스에 버튼을 추가합니다.
                        var msgBox = $('<div class="msgBox receive"></div>');
                        var buttonContainer = $('<span id="in"><span>Chatbot</span><br></span>');
                        buttonContainer.append(button).append('<br><br>');
                        msgBox.append(buttonContainer);
                        $("#chatBox").append(msgBox);
                      }
                    }
                  } // contentTable 루프 종료
                } // 템플릿 종료
              } // bubbles 루프 종료

              // chatBox 맨 아래로 스크롤합니다.
              $("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));
            } else {
              console.error('서버로부터 잘못된 또는 빈 응답을 받았습니다.');
            }
          },
          error: function(data) {
            alert("오류가 발생했습니다.");
          }
        });
      }

      // chatBox 내부의 링크에 클릭 이벤트 리스너를 추가합니다.
      $("#chatBox").on("click", "a", function(event) {
        event.preventDefault(); // 링크의 기본 동작(링크 URL로 이동)을 막습니다.

        // data 속성을 사용하여 클릭한 링크의 "postbackfull" 값을 추출합니다.
        var postbackFullValue = $(this).data("postbackfull");

        // 클릭한 링크의 텍스트를 chatBox에 마치 챗봇이 입력한 것처럼 추가합니다.
        var clickedLinkText = $(this).text();
        var msgBox = $('<div class="msgBox receive"></div>');
        msgBox.html('<span id="in"><span>Chatbot</span><br><span>' + clickedLinkText + '</span></span><br><br>');
        $("#chatBox").append(msgBox);

        // postbackFullValue를 기반으로 다음 대화로 이동하는 함수를 호출합니다.
        callAjax(postbackFullValue);

        // chatBox 맨 아래로 스크롤합니다.
        $("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
      });

      // TTS를 위한 ajax 함수를 호출합니다.
      function callAjaxTTS(result) {
        $.ajax({
          type: "post",
          url: "chatbotTTS",
          data: {
            inputText: result
          },
          dataType: 'text',
          success: function(result) {
            // 오디오 파일 이름을 얻습니다.
          },
          error: function(data) {}
        });
      }
    });