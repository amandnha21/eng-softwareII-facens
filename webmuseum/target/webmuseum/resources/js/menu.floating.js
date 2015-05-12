// Menu floating v1
function hasClass(ele, cls) {
    return ele.className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'));
}
function addClass(ele, cls) {
    if (!this.hasClass(ele, cls)) {
        ele.className += " " + cls;
    }
}
function removeClass(ele, cls) {
    if (hasClass(ele, cls)) {
        var reg = new RegExp('(\\s|^)' + cls + '(\\s|$)');
        ele.className = ele.className.replace(reg, ' ');
    }
}

//setInterval(function () {
//	initwidth = $(".nameSystem").width();
//	
//    var el = document.getElementById('menu'),
//    offset = document.documentElement.scrollTop || document.body.scrollTop;
//    if (offset > 70) { // = 100 - 20
//        addClass(el, 'fixedBanner');	
//		$(".nameSystem").animate({width: "show", opacity: "show"}, "slow" );	
//    } else {
//        removeClass(el, 'fixedBanner');
//		$(".nameSystem").hide("show");
//    }
//}, 60);

/* menu lateral */
setInterval(function() {
    var el = document.getElementById('search-box'),
            offset = document.documentElement.scrollTop || document.body.scrollTop;
    if (offset > 70) { // = 100 - 20
        addClass(el, 'fixedBanner');
    } else {
        removeClass(el, 'fixedBanner');
    }
}, 60);

