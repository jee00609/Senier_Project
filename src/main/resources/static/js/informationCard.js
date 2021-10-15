function createDiv(thisObj) {
	
	let color = Math.floor(Math.random() * 4) + 1;
	
	try{
		var myobj = document.getElementById("newid");
		myobj.remove();
	}
	catch{
		
	}
	
	let $specifyCard = document.getElementById('specifyCard1');
	let $newspecifyCard = $specifyCard.cloneNode(true);
	$newspecifyCard.id = "newid";
	let $targetObject = $newspecifyCard.getElementsByClassName("txt")[0];
	
	//주석
	
	$targetObject.innerHTML = `
							<h2>${thisObj}</h2>
							<p>Please Speak ${thisObj} loudly</p>
							<img src='https://assets.codepen.io/2301174/icon-supervisor.svg' alt=''>
							`;
							
	let inputAudio = "audioName.wav"
	
	let ratingBtn = document.createElement('input');
	ratingBtn.setAttribute("type", "button");
	ratingBtn.setAttribute("id", "apiBtn");
	ratingBtn.setAttribute("value", "Rating");
	ratingBtn.onclick = ()=> button1_click(inputAudio,thisObj);
	$targetObject.appendChild(ratingBtn);
	
	let section = document.getElementById('plz');
	
	
	let div = document.createElement('div');
	div.className = "container h-50";
	
	let div2 = document.createElement('div');
	div2.className = "row justify-content-md-center";
	
	
	
	div2.appendChild($newspecifyCard);
	div.appendChild(div2);
	section.appendChild(div);
	
}


function button1_click(audioName,objName){

	try{
		window.open(`/test?audioName=${audioName}&objName=${objName}`,'_blank');
		console.log("Yeahhhhhhhhhhh");
	}catch(e){
		console.log(e);
	}
}

