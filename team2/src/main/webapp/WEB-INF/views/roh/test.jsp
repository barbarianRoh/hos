<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<!-- 폰트어썸 아이콘 -->
<script src="https://kit.fontawesome.com/f507061817.js" crossorigin="anonymous"></script>

<div class="container">
	<input type="checkbox" id="toggle-menu" />
	<label for="toggle-menu" class="menu-button"><i class="fa-solid fa-chevron-right" style="color: #3f3f3f;"></i></label>

	<aside class="sidebar">
		<ul>
			<li>Menu Item 1</li>
      		<li>Menu Item 2</li>
      		<li>Menu Item 3</li>
    	</ul>
  	</aside>
</div>

<style>
/* 체크박스 폼 요소 감춤 */
#toggle-menu { 
    display: none;
}
/*  */
.container {
	display: flex;
}

.sidebar {
	width: 500px;
  	background-color: #fff;
  	transition: transform 0.5s ease;
  	transform: translateX(-500px);
  	position: fixed;
  	top: 50vh;
  	z-index:1;
}

.sidebar.open {
  	transform: translateX(0);
}

.content {
	flex: 1;
  	padding: 20px;
}

.menu-button {
	cursor: pointer;
	position: absolute;
	top:50vh;
  	z-index: 2;
}
</style>

<script>
var toggleMenu = document.getElementById('toggle-menu');
var sidebar = document.querySelector('.sidebar');

toggleMenu.addEventListener('change', function() {
	if (toggleMenu.checked) {
		sidebar.classList.add('open');
  	} else {
    	sidebar.classList.remove('open');
  	}
});
</script>