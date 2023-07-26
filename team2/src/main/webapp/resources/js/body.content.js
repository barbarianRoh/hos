$('.body-list input').change(function () {
	$('#body-image').removeClass().addClass('body-image' + ($(this).closest('li').index() + 1));
});

$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons = document.querySelectorAll('.ghost-button');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons.forEach(function(ghostButton, index) {
    ghostButton.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});


$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons2 = document.querySelectorAll('.ghost-button2');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons2.forEach(function(ghostButton2, index) {
    ghostButton2.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});



$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons3 = document.querySelectorAll('.ghost-button3');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons3.forEach(function(ghostButton3, index) {
    ghostButton3.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});



$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons4 = document.querySelectorAll('.ghost-button4');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons4.forEach(function(ghostButton4, index) {
    ghostButton4.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});


$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons5 = document.querySelectorAll('.ghost-button5');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons5.forEach(function(ghostButton5, index) {
    ghostButton5.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});



$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons6 = document.querySelectorAll('.ghost-button6');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons6.forEach(function(ghostButton6, index) {
    ghostButton6.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});


$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons7 = document.querySelectorAll('.ghost-button7');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons7.forEach(function(ghostButton7, index) {
    ghostButton7.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});


$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons8 = document.querySelectorAll('.ghost-button8');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons8.forEach(function(ghostButton8, index) {
    ghostButton8.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});


$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons9 = document.querySelectorAll('.ghost-button9');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons9.forEach(function(ghostButton9, index) {
    ghostButton9.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});


$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons9 = document.querySelectorAll('.ghost-button9');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons9.forEach(function(ghostButton9, index) {
    ghostButton9.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});

$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons10 = document.querySelectorAll('.ghost-button10');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons10.forEach(function(ghostButton10, index) {
    ghostButton10.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});

$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons11 = document.querySelectorAll('.ghost-button11');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons11.forEach(function(ghostButton11, index) {
    ghostButton11.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});

$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons12 = document.querySelectorAll('.ghost-button12');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons12.forEach(function(ghostButton12, index) {
    ghostButton12.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});

$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons13 = document.querySelectorAll('.ghost-button13');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons13.forEach(function(ghostButton13, index) {
    ghostButton13.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});


$(document).ready(function() {
  // 몸체 이미지를 업데이트하는 함수
  function updateBodyImage(index) {
    $('#body-image').removeClass().addClass('body-image' + index);
  }

  // 모든 ghost-button 요소들을 가져옵니다
  var ghostButtons14 = document.querySelectorAll('.ghost-button14');

  // 각 ghost-button에 클릭 이벤트 리스너를 추가합니다
  ghostButtons14.forEach(function(ghostButton14, index) {
    ghostButton14.addEventListener('click', function() {
      // 클릭된 ghost-button에 해당하는 몸체 이미지를 업데이트합니다
      updateBodyImage(index + 1);

      // 모든 라디오 버튼을 선택 해제합니다
      $('.body_type').prop('checked', false);

      // 해당하는 라디오 버튼을 선택합니다
      $('.body_type').eq(index).prop('checked', true);
    });
  });

  // 라디오 버튼에 변경 이벤트 리스너를 추가하여 몸체 이미지를 업데이트합니다
  $('.body_type').change(function() {
    var index = $(this).closest('li').index() + 1;
    updateBodyImage(index);
  });
});














