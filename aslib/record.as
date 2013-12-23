



function record_ac_b()
{

	trace("record_b");
	trace("cn:"+cn);
	trace("record:"+record);
	if (record[cn - 1][0] == 1)
	{


		getChildByName(record[cn - 1][1]).visible = false;
		cn--;
	}

	if (record[cn - 1][0] == 2)
	{

		loader_mc.width = record[cn - 1][1];
		loader_mc.height = record[cn - 1][2];
		loader_mc.x = record[cn - 1][3];
		loader_mc.y = record[cn - 1][4];
		cn--;

		scale2 = 1;
	}

	if (record[cn - 1][0] == 4)
	{

		loader_mc.x = record[cn - 1][1];
		loader_mc.y=record[cn-1][2]
		;
		cn--;
	}


}

function record_ac_n()
{

	trace("record_n");
	trace("cn:"+cn);
	trace("record:"+record);
	
	trace("record[cn][0]:"+record[cn][0]);
	
	
	if (record[cn][0] == 1)
	{

		trace("ss");
		getChildByName(record[cn][1]).visible = true;
		cn++;
	}

	if (record[cn][0] == 2)
	{
        trace("************")
		
	  loader_mc.scaleX=record2[cn][0]
      loader_mc.scaleY=record2[cn][1]
      loader_mc.x=record2[cn][2]
      loader_mc.y=record2[cn][3]

		cn++
		;
		scale2 = 1;
	}

	if (record[cn][0] == 4)
	{
      loader_mc.x=record2[cn][0]
      loader_mc.y=record2[cn][1]

		cn++;
	}
}