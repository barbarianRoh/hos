<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
    // To receive the welcome message, send it to the server with an empty value before receiving the message input to receive the welcome message
    callAjax();
    $('#chatForm').on('submit', function(event){
        event.preventDefault();
        if($('#message').val() == "") { // Prevent a welcome message from appearing when the send button is pressed without entering a question
            alert("질문을 입력해주세요");
            return false;
        }
        if($('#message').val() != ""){
            $('#chatBox').append('<div class="msgBox send"><span id="in"><span>' +
                $('#message').val() + '</span></span></div><br>');
        }
        callAjax();
        /* Clear field */
        $('#message').val('');
    }); // end of submit
    
    function callAjax() {
        $.ajax({
            url: "chatbotSend",
            type: "post",
            data: {inputText: $('#message').val()},
            success: function(result){
                /* Add received message to chatBox */
                $('#chatBox').append('<div class="msgBox receive"><span id="in"><span>Chatbot</span><br><span>' +
                    result + '</span></span></div><br><br>');
                
                // Process the received result and add button if applicable
                var parsedResult = JSON.parse(result);
                if (parsedResult.bubbles && parsedResult.bubbles.length > 0) {
                    var bubble = parsedResult.bubbles[0];
                    if (bubble.type === 'template' && bubble.data && bubble.data.contentTable) {
                        var contentTable = bubble.data.contentTable;
                        for (var ct in contentTable) {
                            var ctData = contentTable[ct];
                            for (var ctDataItem in ctData) {
                                var url = ctData[ctDataItem].data.data.action.data.url;
                                $("#chatBox").append('<a href="' + url + '" target="_blank">' + url + '</a><br>');
                            }
                        }
                    }
                }
                
                // scroll up
                $("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));
            },
            error: function(){
                alert("An error has occurred");
            }
        });
    }
});


</script>