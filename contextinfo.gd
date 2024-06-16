extends Panel



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_context_toggled(toggled_on):
	$RichTextLabel.text = "[b]¡Bienvenido a PMC Manager![/b]

El mundo se encuentra en medio de un gran conflicto, tres grandes facciones luchan por el control total del planeta y tú, el jugador, ves esta gran guerra como una oportunidad de hacer dinero, crecer tu poder en este nuevo mundo y posiblemente, cambiar el curso del conflicto. Así que juntas unas pocas personas, compráis una base militar abandonada y montáis una compañía militar privada. Aunque tenéis pocos soldados, recursos y equipamiento, las tres fuerzas no tardan en ponen en contacto contigo para solicitar tus servicios.

[b]Las Naciones Unidas del Oeste (NUO)[/b]

[center][img=850x600]res://art/NUOflag.png[/img][/center]

Las fuerzas más preparadas del conflicto. Es más sencillo decir en qué países los soldados de las NUO NO han sido envíados para intervenir en conflictos locales o en misiones de 'paz'. Son reconocidos mundialmente por su riqueza, eficiencia en combate y su alta tecnología, conseguida a través de una gran industria militar subvencionada por sus ciudadanos (y varios negocios secretos entre su gobierno y empresas armamentísticas).

[b]El Ejército de los Pueblos del Este (EPE)[/b]

[center][img=850x600]res://art/EPEflag.png[/img][/center]

El enemigo histórico de NUO, los Pueblos del Este son más reservados en su intervención militar, optando por absorbir países independientes que hacen frontera con su territorio, inculcando su cultura y manera de vivir con un puño de hierro: su vasto ejército. Aunque su equipamiento sea subpar comparado con el de las fuerzas NUO, poseen grandes cantidades de este, debido a su gran industrialización y aún más grande ejército.

[b] Fuerzas de Liberación Rebelde (FLR)[/b]

[center][img=850x600]res://art/FLRflag.png[/img][/center]

Parece ser que por donde pasan los NUOs y los EPEs, nuevas bases del FLR aparecen. Generalmente se encuentran en países que solían ser independientes hasta que fueron ocupados. Sus soldados siendo ciudadanos con poco entrenamiento y equipamiento en pésima condición, luchan contra la ocupación de las otras dos fuerzas, a través de métodos radicales y financiados por varias actividades altamente ilegales.

[b] ¿Quién apoyarás? ¿Quién atacarás? ¿Mantendrás este conflicto para hacerte asquerosamente rico o pondrás fin a la guerra? Estas decisiones ahora están en tus manos... buena suerte, la necesitarás para sobrevivir. [/b]"


func _on_basicinfo_toggled(toggled_on):
	$RichTextLabel.text = "[b]Información básica[/b]

Durante el transcurso de la guerra, podrás ver en la zona superior de la pantalla varios recursos, el progreso del conflicto en días, quién va ganando la guerra y la reputación de tu PMC con los tres bandos.

[b]Días de conflicto[/b]

Cada vez que cliques “Finalizar planes”, pasará un día del conflicto. Las misiones disponibles se actualizarán, los ítems del Mercado Negro también se actualizarán, habrá pasado un día en las misiones en curso y pagarás a tus soldados. Tu puedes decidir si acabar con el conflicto en el menor número de días posible o alargar el conflicto y amasar riquezas y expandir tu PMC.

[b]Recursos[/b]

Munición: Recurso para llevar a cabo misiones y armar tus soldados.
Raciones: Recurso para llevar a cabo misiones, alimentar y curar tus soldados.
Materiales de construcción: Recurso para mejorar tu Base de Operaciones. Es posible que algunas misiones requieran este material.
Partes: Recurso para mejorar tu Base de Operaciones y reparar tus vehículos. Es posible que algunas misiones requieran este material.
Dinero: Recurso más preciado. Con el Dinero podrás contratar nuevos soldados y comprar ítems del Mercado Negro, llevar a cabo misiones, mejorar tu Base de Operaciones, y más importante, pagar tus soldados. Si te quedas sin Dinero… Pierdes tu PMC y la partida.

[b]El “Guerrametro”[/b]

La barra central superior muestra el poder que tiene cada bando en el conflicto. Cuando asistas a un bando, este afectará negativamente al progreso de la guerra de uno o dos de los bandos restantes (perdiendo reputación con estos) y positivamente al bando que asistas (y ganando reputación). Cuando un bando pierda su presencia, este se considerará derrotado y fuera del conflicto.

[b]Reputación[/b]

En la esquina superior derecha podrás ver la reputación con los tres bandos. Si eres Aliado de un bando te darán más misiones, subirán tus posibilidades de adquirir equipamiento cuando completes una misión solicitada por el bando y pagarán de manera más generosa. En caso de ser Enemigo, las probabilidades de los beneficios anteriores serán aún más bajas, pagarán peor y en casos extremos, intenten llevar a cabo un ataque sobre tu Base de Operaciones… ¡Ve con cuidado!
"


func _on_soldier_toggled(toggled_on):
	$RichTextLabel.text = "[b]Tus soldados[/b]

Cada soldado tiene diferentes características, como su nombre, sus puntos de vida, equipamiento, sus habilidades generales, una habilidad especial y lo más importante, su Habilidad de Combate (HC).

[b]Equipamiento[/b]

Un soldado tiene 4 espacios de equipamiento:
Casco y chaleco: Afectará su nivel de armadura. El nivel de armadura bajará la cantidad de puntos de vida que un soldado recibirá en una misión.
Uniforme: El uniforme podrá cambiar las habilidades de un soldado, pero no su HC.
Arma: El arma de un soldado subirá su HC.

[b]Habilidades [/b]

Cada soldado tiene 5 habilidades generales diferentes, las cuales dependiendo de su valor (A, B, C, D, E, F) subirán o bajarán su HC. Ciertas misiones o incluso la mejora de algunos aspectos de la Base de Operaciones necesitarán una cantidad de soldados con una habilidad en concreto de un cierto nivel en un escuadrón o en general. Las habilidades son las siguientes:

STR: Fuerza      I+D: Investigación y Desarrollo      STL: Sigilo 

						 MED: Medicina      ENG: Ingeniero

Algunos soldados tendrán una habilidad especial, la cual les dará atributos que servirán en algunas misiones, mejorarán su supervivencia, entre otras ventajas.
"


func _on_missionmenu_toggled(toggled_on):
	$RichTextLabel.text = "[b]Lista de misiones[/b]

En la pantalla “Lista de misiones”, el jugador, cada día tendrá un número de misiones disponibles, el cual podrá decidir si llevar a cabo o no, asignando un escuadrón a esta. Una misión puede durar varios días o solo uno. Cada misión tendrá las siguientes características fundamentales:

Coste y recompensa: El coste de llevar la misión a cabo y la recompensa en caso de que la misión sea un éxito.
Duración de la misión: Cuantos días se requerirán para llevar a cabo una misión. ¡Planea de antemano! No podrás modificar ni usar un escuadrón que esté llevando a cabo una misión.
Requerimientos: Los requisitos que tiene una misión para que sea exitosa. Principalmente dependerá del HC necesario, pero en algunos casos requerirá que los soldados tengan unas ciertas habilidades generales, especiales, equipamiento, etc.
Posibles recompensas: Algunas misiones tendrán una pequeña probabilidad de recompensar una misión exitosa con una (o varias) piezas de equipamiento o ítems.
Relaciones y conflicto: Cada misión tendrá un impacto sobre el progreso del conflicto y las relaciones con las tres facciones. ¡Ve con cuidado, tus acciones tienen consecuencias!

[b]Asignar escuadrón[/b]

Cuando hayas decidido que misión llevarás a cabo, la pantalla de “Asignar escuadrón” se abrirá, mostrándote los escuadrones disponibles para asignarles una misión y información sobre cada escuadrón. También tendrás la cifra de probabilidad de victoria, la cual tendrá en cuenta los requerimientos definidos y dará un porcentaje de éxito de la misión cuando se cumpla. Si la probabilidad es muy baja, es posible que tus soldados sean heridos o incluso eliminados en combate.

[b]Misiones en curso[/b]

En todas las pantallas tendrás un botón en la esquina inferior izquierda donde podrás consultar qué escuadrones están disponibles o están llevando a cabo una misión, con los días restantes, los posibles recursos que podrás obtener si la misión es exitosa y la probabilidad de victoria.
"


func _on_headquarters_toggled(toggled_on):
	$RichTextLabel.text = "[b]Base de Operaciones[/b]

¡Este es tu hogar y puesto de trabajo, todo en uno! Aunque al principio estará abandonado y decrépito, a medida que inviertas tus recursos aquí tendrás una base que envidiará a las otras fuerzas de combate. Cada instalación tiene su utilidad y es importante que inviertas en ellas, ya que desbloquearán nuevas habilidades, tener más soldados y escuadrones disponibles, recibir más (¡y mejores!) misiones, entre otros.

Clínica: Aquí podrás curar tus soldados heridos después de cada misión, los podrás dejar descansando y que se curen a medida que pasa el tiempo o podrás acelerar su mejora usando tus raciones y un poco de Dinero. A medida que mejores la Clínica, tus soldados se curarán más rápido.

Centro de Inteligencia: Esta instalación sería el cerebro de tu PMC. A medida que la mejores, desbloquearás más misiones, más misiones disponibles por día y subir la recompensa de todas las misiones que puedas llevar a cabo.

Barracones: Si el Centro de Inteligencia es el cerebro de tu PMC, los Barracones son el corazón. Aquí podrás gestionar que soldados forman parte de tus escuadrones, cuales se quedan en reserva y usar ítems para mejorar tus soldados. A medida que mejores los Barracones, estos tendrán espacio para más escuadrones activos y reservas.

Almacén: Aquí se guardarán todos tus ítems y equipamiento no utilizado por tus soldados. Al mejorar esta instalación, tendrás más espacio para almacenar todo lo que necesites.

Garaje: Cuando tu PMC haya crecido lo suficiente, es posible que necesites vehículos de transporte (coches armados, coches civiles, helicópteros de transporte) o incluso de combate (tanques, carros de combate, helicópteros armados) para llevar a cabo misiones de alto riesgo. Dependiendo del nivel del garaje, este podrá almacenar más vehículos y repararlos más rápidamente (o podrás pagar un extra de Partes y Dinero para acelerar la reparación).
"


func _on_blackmarket_toggled(toggled_on):
	$RichTextLabel.text = "[b]Mercado Negro[/b]

Una misteriosa figura lleva un Mercado Negro durante este conflicto. ¿Su objetivo? Proporcionar todo tipo de ítems, equipamiento y soldados particularmente habilidosos al mejor postor, sean los NUO, EPE, FLR o tu PMC. No tiene ningún otro interés más que aprovechar este gran conflicto para enriquecerse, así que no tiene ninguna afiliación e ignorará tu reputación con las otras fuerzas o tu rol en el conflicto.

Los ítems y equipamiento que ofrece se actualizarán cada día, dependiendo de varios aspectos del conflicto, como el progreso general, días transcurridos, el estado de las facciones, etc. Ofrece dos tipos de contratos con diferentes precios, dependiendo de estos obtendrás soldados de mejor o peor calidad. ¡Ten en cuenta que no podrás adquirir más soldados si tus reservas están llenas!
"
