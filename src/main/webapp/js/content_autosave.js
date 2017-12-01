function saveUserdata(name, data) {
	try {
		if(window.localStorage){localStorage.setItem('C_' + name, data);
		} else if(window.sessionStorage){sessionStorage.setItem('C_' + name, data);}
	} catch(e) {
		if(BROWSER.ie){
			if(data.length < 54889) {
				with(document.documentElement) {setAttribute("value", data);save('C_' + name);}}
		}
	}setcookie('clearUserdata', '', -1);}
function loadUserdata(name) {
	if(window.localStorage){
		return localStorage.getItem('C_' + name);
	} else if(window.sessionStorage){
		return sessionStorage.getItem('C_' + name);
	} else if(BROWSER.ie){
		with(document.documentElement) {load('C_' + name);return getAttribute("value");}
	}
}
function deleteUserdata(name) {
	if(window.localStorage){localStorage.removeItem('C_' + name);
    } else if(window.sessionStorage){sessionStorage.removeItem('C_' + name);} else if(BROWSER.ie){with(document.documentElement) {}}
}

function savedataTime() {
	if(!autosave) {
		$$(editorid + '_svdsecond').innerHTML = '<a title="enable autosave" style="font-weight:normal;" href="javascript:;" onclick="setAutosave()">Enable autosave</a> ';
		return;
	}
	if(!savedatac) {
		savedatac = savedataInterval;
        //Cautocode('svd');
		d = new Date();
		var h = d.getHours();
		var m = d.getMinutes();
		var s = d.getSeconds();
		h = h < 10 ? '0' + h : h;
		m = m < 10 ? '0' + m : m;
		s = s < 10 ? '0' + s : s;
		setEditorTip('Autosaved in ' + h + ':' + m + ':' + s);
	}
	//$$(editorid + '_svdsecond').innerHTML = '<a title="enable autosave" style="font-weight:normal;" href="javascript:;" onclick="setAutosave()">' + 'autosave in' + savedatac + 'second</a> ';
	savedatac -= 10;
}

function setAutosave() {
	autosave = !autosave;
	setEditorTip(autosave ? 'autosave enabled' : 'autosave disabled');
	setcookie('editorautosave_' + editorid, autosave ? 1 : -1, 2592000);
	savedataTime();
}

function setEditorTip(s) {$$(editorid + '_svdsecond_tip').innerHTML = '&nbsp;' + s;}
