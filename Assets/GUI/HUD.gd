extends CanvasLayer

func atualiza_dados(vida, potions, ouro):
	atualiza_vida(vida)
	atualiza_pocoes(potions)
	atualiza_ouro(ouro)
	

func atualiza_vida(valor):
	$Control/ProgressBar.value = valor
	
func atualiza_pocoes(valor):
	$ItemList.set_item_text(0, "x" + str(valor));

func atualiza_ouro(valor):
	$ItemList.set_item_text(1, "x" + str(valor));
