$(function(){
	function display(bool){
		if(bool){
		   $("#content").show();
		} else {
		   $("#content").hide();
		}
   }
	display(false);
	window.addEventListener('message', function(event){

		var item = event.data;
		if(item.type === "ui"){
			if(item.display === true){
				display(true);
			} else { display(false); }
			
		}
		else if(item.type === "msg"){
			if(item.display === true){
				if (item.inline == false){
					$('#header').addClass('header');
					$('#body').addClass('body');
				} else {
					$('#header').addClass('text-center');
				}
				if(item.round == true){
					$('#alert').addClass('round');
				}
				$('#title').text(item.title);
				$('#message').text(item.msg);
				$('#alert').addClass(item.col);
				$('#icon').html(item.icon);
				$('#content').addClass(item.position)
				//this.print("Javascript wurde angesprochen.");
				display(true);
			} else { display(false); }
		}
	});

	document.onkeyup = function(data){
		if (data.which === 27) {
			$.post("https://cfx-nui-validant-notify/exit", JSON.stringify({}));
			return
		}
	}

	$("#close").click(function(){
		$.post("https://cfx-nui-validant-notify/exit", JSON.stringify({}));
		return
	})
});