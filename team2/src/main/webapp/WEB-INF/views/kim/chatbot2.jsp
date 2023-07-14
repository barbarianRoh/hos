<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

$(function(){
    // To receive the welcome message, send it to the server with an empty value before receiving the message input to receive the welcome message
    callAjax();
    $('#chatForm').on('submit', function(event){
        event.preventDefault();
        if($('#message').val() == "") { // Prevent a welcome message from appearing when the send button is pressed without entering a question
            alert("질문을 입력해주세요.");
            return false;
        }
        if($('#message').val() != ""){
            $('#chatBox').append('<div class="msgBox send"><span id="in"><span>' +
                $('#message').val() + '</span></span></div><br>');
        }
        callAjax();
        /* Clear field */
        $('#message'). val('');
    }); // end of submit
    // create a separate ajax
    function callAjax() {
        $.ajax({
            url: "chatbotSend",
            type: "post",
            data: { inputText: $('#message').val() },
            contentType: "application/x-www-form-urlencoded; charset=UTF-8", // Set UTF-8 encoding
            success: function(result){
                /* Add received message to chatBox */
                $('#chatBox').append('<div class="msgBox receive"><span id="in"><span>챗봇</span><br><span>' +
                    result +'</span></span></div><br><br>');
                // scroll up
                $("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));
            },
            error: function(){
                alert("An error has occurred")
            }
        });
    }
});

</script>