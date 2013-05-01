/*
 * Cocktail, HTML rendering engine
 * http://haxe.org/com/libs/cocktail
 *
 * Copyright (c) Silex Labs
 * Cocktail is available under the MIT license
 * http://www.silexlabs.org/labs/cocktail-licensing/
*/
import cocktail.api.CocktailView;
import cocktail.core.html.HTMLTextAreaElement;
import flash.text.TextField;
import js.Lib;

/**
 * 
 */
class Main
{
	static function main()
	{
		new Main();
	}
	
	var tf:TextField;
	
	var cv:CocktailView;
	
	public function new()
	{
		initFlash();
		initCocktail();
	}
	
	function initFlash()
	{
		tf = new TextField();
		tf.width = 200;
		tf.height = 100;
		tf.backgroundColor = 0xFF0000;
		tf.background = true;
		tf.text = "this is a flash text field";
		
		flash.Lib.current.addChild(tf);
	}
	
	function initCocktail()
	{
		cv = new CocktailView();
		cv.viewport = { x:0, y:200, width:400, height:400 };
		cv.loadURL("index.html");
		cv.window.onload = function(e) {
			
			flash.Lib.current.addChild(cv.root);
			
			var form = cv.document.getElementById("frm");
			form.onsubmit = onFormSubmit;
		}
	}
	
	function onFormSubmit(e)
	{
		e.preventDefault();
		var form = e.target;
	
		var ta:HTMLTextAreaElement = cast cv.document.getElementById("ta");
		tf.text = ta.value;
	}
}
