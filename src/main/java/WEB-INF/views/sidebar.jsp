<!DOCTYPE html>
<html>
<head>
  <link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700italic,700,400italic|PT+Serif:400,700,400italic,700italic|Vollkorn|Rokkitt:400,700' rel='stylesheet' type='text/css'>

  
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css'>

      <link rel="stylesheet" href="css/sideToggle/style.css">
</head>
<body>
  <nav>
  <a href="#" id="userPLink">
    <span class="fa fa-user"></span>
    username 
  </a>
  <div id="sideMenu">
    <span class="fa fa-navicon" id="sideMenuClosed"></span>
  </div>
</nav>

<div id="sideMenuContainer">
  <h2>heading</h2>
  <a href="https://www.jquery-az.com/jquery-tips/" title="jQuery Tutorials"><span class="fa fa-bolt"></span></a>
  <a href="https://www.jquery-az.com/bootstrap-tips-tutorials/" title="Bootstrap"><span class="fa fa-exclamation-circle"></span></a>
  <a href="https://www.jquery-az.com/javascript-tutorials/" title="JavaScript"><span class="fa fa-map"></span></a>
  <a href="https://www.jquery-az.com/html-tutorials/" title="HTML"><span class="fa fa-info-circle"></span></a>
  <a href="https://www.jquery-az.com/css-tutorials/" title="CSS"><span class="fa fa-users"></span></a>
  <a href="https://www.jquery-az.com/python-tutorials/" title="Python"><span class="fa fa-camera"></span></a>
  <a href="https://www.jquery-az.com/java-tutorials/" title="Java"><span class="fa fa-commenting"></span></a>
  <a href="https://www.jquery-az.com/tag/animations/" title="Animations"><span class="fa fa-heart"></span></a>
  <a href="https://www.jquery-az.com/tag/table/" title="Tables"><span class="fa fa-flag"></span></a>
</div>

<div id="logo" class='colorchange'>
  toggling
  <span>things is oddly satisfying</span>
</div>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/velocity/1.2.3/velocity.min.js'></script>
<script src='js/sideToggle/sideToggleExtended.js'></script>

<script>
    
$(document).ready(function(){
	  $('.menu-tab').click(function(){
	    $('.menu-hide').toggleClass('show');
	    $('.menu-tab').toggleClass('active');
	  });
	  $('a').click(function(){
	    $('.menu-hide').removeClass('show');
	    $('.menu-tab').removeClass('active');
	  });
	});
</script>

</body>
</html>

