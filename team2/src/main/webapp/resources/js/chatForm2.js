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

              // image / multi-link response common (with contentTable)
              for (var ct in bubbles[b].data.contentTable) {
                var ct_data = bubbles[b].data.contentTable[ct];
                for (var ct_d in ct_data) {
                  // Get the postback value of each link.
                  var postbackValue = ct_data[ct_d].data.data.action.data.postback;
                  var displayText = ct_data[ct_d].data.data.action.data.displayText;

                  // Generates a link using "displayText" as the link text.
                  var link = $("<a></a>")
                    .attr("href", "#") // Use "#" to avoid redirecting the page when the link is clicked.
                    .data("postbackfull", ct_data[ct_d].data.data.action.data.postbackFull) // use "postbackFull" to get the full postback value
                    .text(displayText); // use "displayText" instead of "formName"

                  // Add the link to the chatBox as if the chatbot entered it.
					var msgBox = $('<div class="msgBox receive"></div>');
					var linkContainer = $('<span id="in"><span>Chatbot</span><br></span>');
					linkContainer.append(link).append('<br><br>');
					msgBox.append(linkContainer);
					$("#chatBox").append(msgBox);


                  // Call TTS for voice conversion.
                  callAjaxTTS(displayText);
                }
              } // End of contentTable for statement
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
