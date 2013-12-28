broad_m.visible = false;
broad_o.visible = false;

var btn10_var:Boolean = false;

btn10.addEventListener(MouseEvent.MOUSE_DOWN ,btn10_Down);

function btn10_Down(event:MouseEvent):void
{
	if (btn10_var==false)
	{

		btn10.gotoAndStop(1);
		broad_m.visible = true;

		broad_m.play();
		btn10_var = true;
		moveTween = new Tween(btn11,"x",Regular.easeIn,btn11.x,b11x + 10,0.2,true);
	}
}

//broad_o.btn.addEventListener(MouseEvent.MOUSE_DOWN ,btn10s_Down);

function btn10s_Down(event:MouseEvent):void
{
	broad_m.gotoAndStop(1);
	broad_m.visible = false;
	broad_o.visible = false;
	btn10_var=false;
}