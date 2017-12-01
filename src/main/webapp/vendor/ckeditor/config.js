/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	
	// %REMOVE_START%
	// The configuration options below are needed when running CKEditor from source files.
	config.plugins = 'codesnippet';
	config.skin = 'bootstrapck-dev';
	config.codeSnippet_theme = 'monokai_sublime';
	// %REMOVE_END%
    config.extraPlugins = 'dialogui,dialog,dialogadvtab,basicstyles,blockquote,toolbar,clipboard,panelbutton,panel,floatpanel,colorbutton,colordialog,templates,menu,contextmenu,copyformatting,div,resize,elementspath,enterkey,entities,popup,filebrowser,fakeobjects,flash,floatingspace,listblock,richcombo,font,format,horizontalrule,htmlwriter,wysiwygarea,image,indent,indentblock,indentlist,smiley,justify,menubutton,language,link,list,liststyle,magicline,maximize,pastetext,pastefromword,removeformat,save,showblocks,showborders,sourcearea,specialchar,stylescombo,tab,table,tabletools,tableselection,undo,lineutils,widgetselection,widget,mathjax';
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.toolbar = [
		{ name: 'clipboard', items: [ 'Save','Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
		{ name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
		{ name: 'insert', items: [ 'Image', 'Mathjax','CodeSnippet','Table', 'HorizontalRule', 'SpecialChar' ] },
		{ name: 'tools', items: [ 'Maximize' ] },
		'/',
		{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Strike', '-', 'RemoveFormat' ] },
		{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
		{ name: 'styles', items: [ 'Styles', 'Format' ] }
	];
	config.mathJaxLib = '//cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS_HTML';

	config.removeButtons = 'Underline,Strike,Subscript,Superscript,Anchor'
};
