<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script defer type="text/javascript" src="/hos/resources/js/body.content.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4352b5c75fa4dee61f430ab3f1ff6f4&libraries=services"></script>
<link rel="stylesheet" type="text/css" href="/hos/resources/css/symptom2.css">
<title>증상체크</title>
    <style>
        .symptompage {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        #buttonContainer {
            margin-bottom: auto;
        }

        /* 기존 CSS 스타일들 */
    </style>
	<script>
	var address = null;
	var sido = null;
	var gugun = null;
	
	if(navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(onSuccess, onError);
	} else {
		console.log("Geolocation 위치정보 오류")
	}
	
	function onSuccess(position) {
		var latitude = position.coords.latitude;
		var longitude = position.coords.longitude;
		var coords = new kakao.maps.LatLng(latitude, longitude);
		
		var geocoder = new kakao.maps.services.Geocoder();
		
		geocoder.coord2Address(coords.getLng(), coords.getLat(), function(result, status) {
			if(status === kakao.maps.services.Status.OK) {
				address = result[0].address.address_name;
				
				sido = result[0].address.address_name.split(" ")[0];
				gugun = result[0].address.address_name.split(" ")[1];
				
				console.log(address);
				console.log(sido);
				console.log(gugun);
			} else {
				console.error("Error getting address: ", status);
			}
		});
	}
	
	function onError(error) {
		console.error("Error getting location: ", error.message);
	}
	</script>
</head>


<body>
	<div class ="symptompage">
		<header>헤더</header>
		<article id ="content">
			<div class="content-header" data-cms-content="/health/_content/title"><!-- 뭔지 모르겠음 -->
				<h2 class="content-title">
					<div>신체부위별 찾기</div>
				</h2>
			</div>
			<div class="content-body cms-search cms-print" id="cms-content">
				<div class="box-guide d-down-md">
					<p>증상을 보이는 신체부위를 선택하세요</p>
				</div>
				<div class="body-search">
					<div id="body-image" class="body-imaege"style="
						margin-left: 100px;
						margin-right: 100px;
						
					">
						<button class="ghost-button"></button>
						<input type="button" class="ghost-button" value="머리" id="head" onclick="addNewButton('head', 3)">

					    <script>
					        var customButtonNames = {
					            head: ['두통', '어지럼증', '편두통'],
					            urology:['통증','혈뇨','요실금'],
					            abdomen:['구토','복통','설사','변비','속쓰림'],
					            face:['눈 충혈','저시력','눈간지럼','코 막힘'],
					            chest:['객혈','호흡곤란','흉통','가슴쓰림'],
					            ear:['귀 통증','이명','난청'],
					            mouth:['이 통증','이 시림','잇몸 출혈'],
					            neck:['기침'],
					            hand:['손떨림']
					        
					            	
					            // Add more custom button names and links here
					        };
					        
							var hos1 = 'http://localhost:8080/hos/choo/resultHos';
					
					        var customButtonLinks = {
					            head: {
					                '두통': '',
					                '어지럼증': '',
					                '편두통': '',
					                '손 떨림': ''
					            },
					            urology: {
					                '통증': '',
					                '혈뇨': '',
					                '요실금': ''
					            },
					            abdomen: {
					                '구토': '',
					                '복통': '',
					                '설사': '',
					                '변비': '',
					                '속쓰림': ''
					                
					            },
					            face: {
					                '눈 충혈': '',
					                '저시력': '',
					                '눈간지럼': '',
					                '귀 통증': '',
					                '이명': '',
					                '난청': '',
					                '이 통증': '',
					                '이 시림': '',
					                '잇몸 출혈': '',
					                '코 막힘': ''
					            },
					            chest: {
					                '객혈': '',
					                '호흡곤란': '',
					                '흉통': '',
					                '가슴쓰림': '',
					                '기침': ''
					            },
					            // Add more custom button links here
					        };
					
					        function addNewButton(type, count) {
					            var buttonContainer = document.getElementById('buttonContainer');
					            buttonContainer.innerHTML = ''; // Clear previous buttons
					            
					            for (var i = 0; i < count; i++) {
					                var button = document.createElement('button');
					                button.setAttribute('class', 'link-button');
					                var buttonName = customButtonNames[type][i] || type + ' Button ' + (i + 1);
					                button.textContent = buttonName;
					                button.onclick = createCustomLinksHandler(type, buttonName);
					                buttonContainer.appendChild(button);
					            }
					        }
					
					        function createCustomLinksHandler(type, buttonName) {
					            return function() {
					            	var queryParams = '';
					            	
					            	if(buttonName === '통증'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('비뇨기') +
							                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('통증') +
							                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
							                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '혈뇨'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('비뇨기') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('혈뇨') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '어지럼증'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('머리') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('어지럼증') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '요실금'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('비뇨기') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('요실금') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '두통'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('머리') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('두통') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '편두통'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('머리') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('편두통') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '손 떨림'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('머리') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('손 떨림') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	}else if(buttonName === '구토'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('배') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('구역질/구토') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '복통'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('배') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('복통') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '설사'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('배') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('설사') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '변비'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('배') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('변비') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '속쓰림'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('배') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('속쓰림') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '눈 충혈'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('눈충혈') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '저시력'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('저시력') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '눈간지럼'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('눈간지럼') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '귀 통증'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('귀통증') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '이명'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('이명') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '난청'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('난청') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '이 통증'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('이통증') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '이 시림'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('이시림') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '잇몸 출혈'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('잇몸출혈') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '코 막힘'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('코막힘') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '객혈'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('객혈') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '호흡곤란'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('호흡곤란') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '흉통'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('흉통') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '기침'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('기침') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '가슴쓰림'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('가슴쓰림') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '손떨림'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('머리') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('손떨림') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	}       
					        	
					                var link = hos1;
					                var buttonText = buttonName; // Default text
					                
					                //머리
					                if (buttonName === '두통') {
					                    buttonText = '내과';
					                } else if (buttonName === '어지럼증') {
					                    buttonText = '내과';
					                } else if (buttonName === '편두통') {
					                    buttonText = '내과';
					                } else if (buttonName === '손떨림') {
					                    buttonText = '내과';
					                } 
					                
					                //생식기
					                if (buttonName === '통증'){
					                	buttonText= '비뇨기과';
					                } else if (buttonName === '혈뇨'){
					                	buttonText = '비뇨기과';
					                } else if (buttonName === '요실금'){
					                	buttonText = '비뇨기과';
					                } 
					                
					                //복부
					                if (buttonName === '구토'){
					                	buttonText = '내과';
					                } else if (buttonName === '복통'){
					                	buttonText = '내과';
					                } else if (buttonName === '설사'){
					                	buttonText = '내과';
					                } else if (buttonName === '변비'){
					                	buttonText = '내과'
					                } else if (buttonName === '속쓰림'){
					                	buttonText = '내과';
					                }
					                
					                if (buttonName === '귀 통증'){
					                	buttonText = '이비인후과';
					                } else if (buttonName === '이명'){
					                	buttonText = '이비인후과';
					                } else if (buttonName === '난청'){
					                	buttonText = '이비인후과';
					                } else if (buttonName === '코 막힘'){
					                	buttonText = '이비인후과'
					                } else if (buttonName === '이 통증'){
					                	buttonText = '치과';
					                } else if (buttonName === '이 시림'){
					                	buttonText = '치과';
					                } else if (buttonName === '잇몸 출혈'){
					                	buttonText = '치과';
					                } else if (buttonName === '눈 충혈'){
					                	buttonText = '안과';
					                } else if (buttonName === '눈간지럼'){
					                	buttonText = '안과';
					                } else if (buttonName === '저시력'){
					                	buttonText = '안과';
					                } else if (buttonName === '얼굴 떨림'){
					                	buttonText = '내과';
					                }
					                
					                if (buttonName === '객혈'){
					                	buttonText = '흉부외과';
					                } else if (buttonName === '호흡곤란'){
					                	buttonText = '흉부외과';
					                } else if (buttonName === '흉통'){
					                	buttonText = '흉부외과';
					                } else if (buttonName === '기침'){
					                	buttonText = '내과';
					                } else if (buttonName === '가슴쓰림'){
					                	buttonText = '내과';
					                }
					                
					                if (link) {
					                    var buttonContainer = document.getElementById('buttonContainer');
					                    buttonContainer.innerHTML = '';
					                    addButtonWithLink(link +'?' + queryParams, buttonText);
					                }
					            };
					        }
					
					
					        function addButtonWithLink(link, buttonText) {
					            var buttonContainer = document.getElementById('buttonContainer');
					            var button = document.createElement('a');
					            button.setAttribute('href', link);
					            button.setAttribute('class', 'link-button');
					            button.textContent = buttonText;
					            buttonContainer.appendChild(button);
					        }
					    </script>
												
						<button class="ghost-button2"></button>
						<button class="ghost-button2"></button>
						<button class="ghost-button2"></button>
						<button class="ghost-button2"></button>
						<button class="ghost-button2"></button>																	
						<input type="button" class="ghost-button2" value="가슴" id = "chest" onclick="addNewButton('chest', 4)">

						
						<button class="ghost-button3"></button>
						<button class="ghost-button3"></button>
						<button class="ghost-button3"></button>																								
						<button class="ghost-button3"></button>
						<input type="button" class="ghost-button3" id="neck" value="목" onclick="addNewButton('neck', 1)">
						
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<input type="button" class="ghost-button4" id="abdomen" value="복부" onclick="addNewButton('abdomen', 5)">
						
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<input type="button" class="ghost-button5" id="urology" value="생식기" onclick="addNewButton('urology', 3)">
						
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<input type="button" class="ghost-button6" id="hand" value="손" onclick="addNewButton('hand', 1)">

						

						
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button id="armHandButton" class="ghost-button7" onclick="loadNewButton()"></button>
						
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<input type="button" class="ghost-button8" id="hand" value="손" onclick="addNewButton('hand', 1)">
						
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button id="armHandButton" class="ghost-button9" onclick="loadNewButton()"></button>
						
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>

						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						
						<button class="ghost-button14"></button>
						<button class="ghost-button14"></button>
						<button class="ghost-button14"></button>
						<input type="button" class="ghost-button14" id="face" value="얼굴" onclick="addNewButton('face', 4)">

						<button class="ghost-button15"></button>
						<button class="ghost-button15"></button>
						<button class="ghost-button15"></button>
						<input type="button" class="ghost-button15" id="ear" value="귀" onclick="addNewButton('ear', 3)">

						<button class="ghost-button16"></button>
						<button class="ghost-button16"></button>
						<button class="ghost-button16"></button>
						<input type="button" class="ghost-button16" id="ear" value="귀" onclick="addNewButton('ear', 3)">
						
						<button class="ghost-button17"></button>
						<button class="ghost-button17"></button>
						<button class="ghost-button17"></button>
						<input type="button" class="ghost-button17" id="mouth" value="입" onclick="addNewButton('mouth', 3)">
						
												
			        	<form action="#" class="body-menu">
			        		<fieldset>
			        			<legend class="d-up-lg">증상을 보이는 신체부위를 선택하세요</legend>
			        			<ul class="body-list">
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody" checked value="on">
				        					<span class="label">전신</span>
			        					</label>
			        				</li>
			
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody" value ="head" > <!-- 외과 -->
				        					<span class="label">머리</span>
			        					</label>
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value ="psyco"> <!-- 정신과 -->
			        						<span class="label">정신</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody" value ="face">
				        					<span class="label">얼굴</span>
			        					</label>
			        				</li>
			        				
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody" value = "neck"> <!-- 내과 -->
				        					<span class="label">목</span>
				        				</label>	
			        				</li> 
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value = "chest"> <!-- 내과  -->
			        						<span class="label">가슴/등</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody" value = "abdomen"> <!-- 내과 -->
				        					<span class="label">복부</span>
				        				</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value ="urology"><!--비뇨기과 -->
			        						<span class="label">생식/비뇨기</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value = "arm">
			        						<span class="label">팔과 손</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value = "leg">
			        						<span class="label">다리와 발</span>
			        					</label>
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value = "born">
			        						<span class="label">뼈/근육</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value ="skin"> <!-- 피부과  -->
			        						<span class="label">피부</span>
			        					</label>
			        				</li>			        				        				        				        				        				        				        				        				       				        				        				        				
			        			</ul>
			        			<div class="btn-area">
			        				<button class="btn_search btn btn-lg btn-round btn-primary" type="button">검색</button>
										<script>
										$(function() {
										  $(".btn_search").click(function() {
										    var selectedBody = $("input[name='inputBody']:checked").val();
										    var newButton = $("<button>");
										    newButton.addClass("custom-button");
										
										    if (selectedBody === "on") {
										      newButton.text("종합병원");
										      newButton.attr("data-link", "https://www.example.com/general_hospital");
										    } else if (selectedBody === "head") {
										      newButton.text("외과");
										      newButton.attr("data-link", "https://www.example.com/surgery");
										    } else if (selectedBody === "psyco") {
										      newButton.text("정신과");
										      newButton.attr("data-link", "https://www.example.com/psychiatry");
										    } else if (selectedBody === "face") {
											      newButton.text("내과");
											      newButton.attr("data-link", "https://www.example.com/psychiatry");
										    } else if (selectedBody === "neck") {
											      newButton.text("이비인후과");
											      newButton.attr("data-link", "https://www.example.com/psychiatry");
										    } else if (selectedBody === "chest") {
											      newButton.text("흉부외과");
											      newButton.attr("data-link", "https://www.example.com/psychiatry");
											} else if (selectedBody === "abdomen") {
											      newButton.text("내과");
											      newButton.attr("data-link", "https://www.example.com/psychiatry");
											} else if (selectedBody === "urology") {
											      newButton.text("비뇨기과");
											      newButton.attr("data-link", "https://www.example.com/psychiatry");
											} else if (selectedBody === "arm") {
											      newButton.text("외과");
											      newButton.attr("data-link", "https://www.example.com/psychiatry");
											} else if (selectedBody === "leg") {
											      newButton.text("외과");
											      newButton.attr("data-link", "https://www.example.com/psychiatry");
											} else if (selectedBody === "born") {
											      newButton.text("정형외과");
											      newButton.attr("data-link", "https://www.example.com/psychiatry");
											} else if (selectedBody === "skin") {
											      newButton.text("피부과");
											      newButton.attr("data-link", "https://www.example.com/psychiatry");
											}
										    
										    // Add more cases for other body parts...
										
										    newButton.click(function() {
										      var link = $(this).attr("data-link");
										      window.open(link, "_blank");
										    });
										
										    $("#buttonContainer").append(newButton);
										  });
										});
										</script>

			        			</div>			        			
			        		</fieldset>       	
        				</form> 
        				</div>
					</div>
				</div>            
		</article>
								<div id="buttonContainer" class="add-button">
						    <!-- 새로운 버튼이 여기에 추가됩니다. -->
						</div>
	</div>
</body>
</html>