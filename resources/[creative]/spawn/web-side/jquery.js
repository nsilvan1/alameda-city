var newCharacter = false ;
$(document).ready(() => {
	var audio = document.getElementById("muzica");
        audio.volume = 0.04;

	$(".buttonGroup > .buttonsBox > button").on("click",function(){
		$(this).parent().find("button").removeClass("active")
		$(this).addClass("active");
	});

	$(".spawnBox").on("click",function(){
		$(".spawnBox").removeClass("active");
		$(this).addClass("active");
	});

	function returnSeleted(type){
		return $(`#${type}`).find(".active").attr("id");
	}

	window.addEventListener("message",function(event){
		switch (event["data"]["action"]){
			case "openSystem":
				$("#charPage").css("display","block");
				generateDisplay();
			break;

			case "closeSystem":
				$("#charPage").css("display","none");
			break;

			case "openSpawn":
				generateSpawn();
			break;

			case "closeNew":
				$("#charPage").css("display","none");
				$("#createPage").css("display","none");
			break;

			case "closeSpawn":
				$("#spawnPage").css("display","none");
			break;
		};
	});

	$(document).on("click",".charBox",function(e){
		$.post("http://spawn/characterChosen",JSON.stringify({ id: parseInt(e["currentTarget"]["dataset"]["id"]) }));
		$("#charPage").css("display","none");
		var audioplay = document.getElementById("muzica");
        	audioplay.muted = true;
        	audioplay.pause();
	});

	$(document).on("click",".charNew",function(e){
		$("#charPage").css("display","none");
		$("#createPage").css("display","block");
	});

	$(document).on("click","#createBack",function(e){
		$("#charPage").css("display","block");
		$("#createPage").css("display","none");
	});

	$(document).on("click",".spawnBox",function(e){
		$.post("http://spawn/spawnChosen",JSON.stringify({ hash: parseInt(e["currentTarget"]["dataset"]["hash"]) }));
	});

	$(document).on("click","#spawnNew",function(e){
		$.post("http://spawn/spawnChosen",JSON.stringify({ hash: "spawn" }));
	});

	$(document).on("click","#spawnNew2",function(e){
		$.post("http://spawn/spawnChosen",JSON.stringify({ hash: "spawn" }));
	});

	$(document).on("click","#createNew",function(e){
		var name = $("#charNome").val();
		var name2 = $("#charSobrenome").val();
		var gender = returnSeleted("gender");
		var locate = returnSeleted("locate");
		var audioplay = document.getElementById("muzica");
        	audioplay.muted = true;
        	audioplay.pause();

		if (name != "" && name2 != ""){
			$.post("http://spawn/newCharacter",JSON.stringify({ name: name, name2: name2, sex: gender, loc: locate }));
			newCharacter = true
		}

	});
});

const generateDisplay = () => {
	$.post("http://spawn/generateDisplay",JSON.stringify({}),(data) => {

		var characterList = data["result"].sort((a,b) => (a["user_id"] > b["user_id"]) ? 1 : -1);

		$("#charPage").html(`
			<div id="SelectPerson">Seleção de Personagem</div>

			${characterList.map((item) => (`
				<div class="charBox" data-id="${item["user_id"]}">
					<div class="charBoxTitle">
						<t1>${item["name"]}</t1> 
						<t3>${(item["count"] > 1) ? "PAGO" : "✔️"}</t3>
					</div>
					<t2>RG: ${item["user_id"]}</t2>
				</div>`)).join("")}

			<div class="charNew">Novo Personagem</div>
		`);
	});
}

const generateSpawn = () => {
	$.post("http://spawn/generateSpawn",JSON.stringify({}),(data) => {
		var characterList = data["result"].sort((a,b) => (a["name"] > b["name"]) ? 1 : -1);
        if (!newCharacter) {
			$("#spawnPage").html(`
				${characterList.map((item) => (`
					<div class="spawnBox" data-hash="${item["hash"]}">
						${item["name"]}
					</div>`)).join("")}

				<div id="spawnNew" data-hash="spawn">Confirmar</div>
			`);
	    }else {
			$("#spawnPage").html(`
			  <div class="newPersonal" > 
			      <img class="imgNewPeson" src="background.png"></img>
				  <audio controls autoplay style="display:none">
				    <source src="InicioAlameda.mp3" type="audio/mpeg">
				  </audio>
			  </div>
			  <div id="spawnNew2" style="display:none" data-hash="spawn">Confirmar</div>
			`);
		}
 		$("#spawnPage").css("display","block");

		setTimeout(function(){
			$("#spawnNew2").show()
		}, 100000);

	});
}



