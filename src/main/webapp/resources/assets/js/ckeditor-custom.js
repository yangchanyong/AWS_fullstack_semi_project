ClassicEditor
    .create(document.querySelector('#editor'),{
    	ckfinder : {
    		uploadUrl : '/ckImage.json'
    	},
    	removePlugins: [ 'Heading' ],
    	language: 'ko' // 언어 설정
    		
    }).then( contents => {
    	theEditor = contents;
    })
    .catch(error => {
        console.error(error);
    });
	