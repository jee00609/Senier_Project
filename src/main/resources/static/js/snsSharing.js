function snsShare(snsName,objName,score){
	
	//var snsName = "twitter";
	var link = "https://jee00609.github.io/";
	
	var title;
	title = '당신이 선택한 단어 '+ objName + '의 발음 점수는 '+score+'입니다. \n - 해당 프로젝트를 구현한 개발자의 블로그를 방문해주세요!';
	
	//var title = "프로젝트 개발자 깃 블로그";
	
	console.log(title);
	
	if (title === null) return false;

	var snsPopUp;
	
	var _width = '500';
	var _height = '450';
	var _left = Math.ceil(( window.screen.width - _width )/2);
	var _top = Math.ceil(( window.screen.height - _height )/2);

	switch(snsName){
		case 'facebook':
			snsPopUp = window.open("http://www.facebook.com/sharer/sharer.php?u=" + link, '', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
			break;

		case 'twitter' :
			snsPopUp = window.open("http://twitter.com/intent/tweet?url=" + link + "&text=" + title, '', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
			break;

		case 'addurl' :
			var dummy = document.createElement("textarea");
			document.body.appendChild(dummy);
			dummy.value = link;
			dummy.select();
			document.execCommand("copy");
			document.body.removeChild(dummy);
			alert("URL이 클립보드에 복사되었습니다.");
			break;
	}
}