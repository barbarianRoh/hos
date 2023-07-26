<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function() {
	$(function() {
		  // To receive a welcome message, first make a request to the server with an empty value to receive a welcome message, then wait for a message to be entered.
		  callAjax();

		  // Ask a question and get an audio response (text)
		  $('#chatForm').on('submit', function(event) {
		    event.preventDefault();
		    if ($('#message').val() == "") {
		      // Prevent the welcome message from being displayed when the submit button is clicked without entering a question.
		      alert("Please enter a question");
		      return false;
		    }
		    if ($('#message').val() != "") {
		      $('#chatBox').append('<div class="msgBox send"><span id="in"><span>' +
		        $('#message').val() + '</span></span></div><br>');
		    }
		    callAjax();
		    /* Initialize fields */
		    $('#message').val('');
		  }); // end send button event

		  // Create a separate ajax function.
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
		          // Get the return value in JSON format.
		          var bubbles = result.bubbles;
		          for (var b in bubbles) {
		            if (bubbles[b].type == 'text') { // if this is the default answer
		              /* Add the received message to the chatBox. */
		              $('#chatBox').append('<div class="msgBox receive"><span id="in"><span>챗봇</span><br><span>' +
		                bubbles[b].data.description + '</span></span></div><br><br>');

		              // Call TTS for voice conversion.
		              callAjaxTTS(bubbles[b].data.description);
		            } else if (bubbles[b].type == 'template') { // image response or multilink response
		              if (bubbles[b].data.cover.type == "image") { // if it is an image
		                $("#chatBox").append("<img src='" + bubbles[b].data.cover.data.imageUrl +
		                  "' alt='No Image'>");
		                if (bubbles[b].data.contentTable == null) {
		                  $("#chatBox").append("<a href='" + bubbles[b].data.cover.data.action.data.url + "' target='_blank'>" +
		                    bubbles[b].data.cover.data.action.data.displayText + "</a><br>");
		                } else {
		                  $("#chatBox").append("<div class=\"msgBox receive\"><span id=\"in\"><span>Chatbot</span><br><span>" + bubbles[b].data.cover.data.description + "</p>");
		                  // Call TTS for voice conversion.
		                  callAjaxTTS(bubbles[b].data.cover.data.description);
		                }
		              } else if (bubbles[b].data.cover.type == "text") { // In case of multi-link response
		                $("#chatBox").append("<div class=\"msgBox receive\"><span id=\"in\"><span>Chatbot</span><br><span>" + bubbles[b].data.cover.data.description + "</p>");
		                // Call TTS for voice conversion.
		                callAjaxTTS(bubbles[b].data.cover.data.description);
		              }

		              // 객관식 답변 생성
						for (var ct in bubbles[b].data.contentTable) {
						  var ct_data = bubbles[b].data.contentTable[ct];
						  for (var ct_d in ct_data) {
						    // 각 링크의 postback 값을 가져옵니다.
						    var postbackValue = ct_data[ct_d].data.data.action.data.postback;
						    var displayText = ct_data[ct_d].data.data.action.data.displayText;
						
						    // 버튼을 생성하고 텍스트는 "displayText"를 사용합니다.
						    var button = $("<button></button>")
						      .attr("type", "button")
						      .data("postbackfull", ct_data[ct_d].data.data.action.data.postbackFull) // 전체 postback 값을 가져오려면 "postbackFull"을 사용합니다.
						      .addClass("button-link") // 버튼에 "button-link" 클래스를 추가하여 스타일을 적용합니다.
						      .text(displayText) // "formName" 대신 "displayText"를 사용합니다.
						      .click((function(displayText) {
						        // closure를 이용하여 displayText 값을 각각의 click 핸들러에 할당합니다.
						        return function() {
						          // 버튼이 클릭되면 해당 URL로 이동합니다.
						          var postbackValue = $(this).data("postbackfull");
						
						          // 사용자가 입력한 것처럼 새 메시지 창에 "displayText"를 추가합니다.
						          var userMsgBox = $('<div class="msgBox send"><span id="in"><span>' + displayText + '</span></span></div><br><br>');
						          $("#chatBox").append(userMsgBox);
						
						          // 음성 변환을 위해 TTS를 호출합니다.
						          callAjaxTTS(displayText);
						
						          callAjax(postbackValue); // 새 질문을 출력합니다.
						          // window.location.href = postbackValue; // 이동 대신 새 질문을 출력하려면 이 줄을 주석 처리합니다.
						        };
						      })(displayText));
						
						    // 챗봇이 입력한 것처럼 버튼을 chatBox에 추가합니다.
						    var msgBox = $('<div class="msgBox receive"></div>');
						    var buttonContainer = $('<span id="in"><span>Chatbot</span><br></span>');
						    buttonContainer.append(button).append('<br><br>');
						    msgBox.append(buttonContainer);
						    $("#chatBox").append(msgBox);
						  }
						} // End of contentTable for statement
                        for(var ct in bubbles[b].data.contentTable){
                            var ct_data = bubbles[ct].data.contentTable[ct];
                            for(var ct_d in ct_data){
                                $("#chatBox").append
                                ("<a href='"+ct_data[ct_d].data.data.action.data.url+"' target='_blank'>" +
                                    ct_data[ct_d].data.data.action.data.url+ "</a><br>");
                            }
                        }
						
		            } // end template
		          }

		          // Scroll to the bottom of the chatBox
		          $("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));
		        } else {
		          console.error('Received an invalid or empty response from the server.');
		        }
		      },
		      error: function(data) {
		        alert("An error has occurred");
		      }
		    });
		  }

		  // Add a click event listener to the link inside the chatBox.
		  $("#chatBox").on("click", "a", function(event) {
		    event.preventDefault(); // Prevent the link's default action (go to the link URL).

		    // Use the data attribute to extract the "postbackfull" value of the clicked link.
		    var postbackFullValue = $(this).data("postbackfull");

		    // Append the clicked link's display text to the chatBox as if the chatbot entered it.
		    var clickedLinkText = $(this).text();
		    var msgBox = $('<div class="msgBox receive"></div>');
		    msgBox.html('<span id="in"><span>Chatbot</span><br><span>' + clickedLinkText + '</span></span><br><br>');
		    $("#chatBox").append(msgBox);

		    // Call a function that moves to the next conversation based on postbackFullValue.
		    callAjax(postbackFullValue);

		    // Scroll to the bottom of the chatBox
		    $("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
		  });

		  // Call the ajax function for TTS.
		  function callAjaxTTS(result) {
		    $.ajax({
		      type: "post",
		      url: "chatbotTTS",
		      data: {
		        inputText: result
		      },
		      dataType: 'text',
		      success: function(result) {
		        // Get the audio file name.
		      },
		      error: function(data) {}
		    });
		  }
		});


</script>