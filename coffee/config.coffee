requirejs.config
	baseUrl: "assets/scripts"

	paths:
		"domReady": "components/domReady/domReady"
		"Snake": "compiled/modules/Snake"
		"main": "compiled/main"

	modules: [
		{
			name: 'main'
		},
		{
			name: 'Snake'
		}
	]