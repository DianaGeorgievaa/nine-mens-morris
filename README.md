# nine-mens-morris

Финален проект за избираемата дисциплина Програмиране със Swift, ФМИ, летен семестър 2019-2020

# Описание:
Дама е игра, която се играе от двама играчи с пулове, като всеки от тях избира в началото свой цвят (единият играе с пулове в светъл цвят, а другият – в тъмен). Играчите разполагат с по девет пула, които последователно поставят на дъската на определените места.

# Правила:
Играта "Дама", позната още като "Коран", се играе от двама играчи на дъска с три квадрата един в друг със свързани среди на страните, като пресечните точки на линиите образуват 24 позиции за поставяне на пуловете. Всеки играч в началото има девет пула.

#### 1. Поставяне на пуловете
Играта започва върху празна дъска, на която играчите поставят пуловете си на свободни позиции, като се редуват.

Ако играч успее да подреди три свои пула по една от правите линии на дъската, той има "дама" и премахва един от пуловете на противника. Премахнат пул не се поставя обратно на дъската. От направена "дама" не може да се премахва пул, освен в случай, че няма други свободни пулове.

#### 2. Местене на пуловете
След като играчите поставят всички свои пулове на дъската, започват да ги местят. Пул може да бъде преместен по линия на дъската до съседна свободна позиция. Ако играч не може да премести нито един свой пул, той губи играта.

Както при поставянето, ако играч подреди "дама", той премахва един от пуловете на противника, като по възможност не разваля направена противникова "дама". Ако играч остане само с два пула, той вече не може да прави "дама" и да взема пулове на противника, при което губи играта.

### 3. Летене
Ако играч остане само с три пула, той може да ги мести на всяка свободна позиция, не само на съседните. Това се нарича "летене" или "скачане".

### Общи

Целта на играта е да се прави "дама", при което се взема по един пул на противника, докато той остане само с два пула, или да се затворят пуловете на противника, така че той да не може да мести.

Добра стратегия е правенето на съседни "дами", при което с всяко местене на единия пул се затваря една от тях и се взема по един противников пул (както на схемата – с белите пулове - ○).

```
· - - - - - · - - - - - ·
|           |           |
|   · - - - · - - - ○   |
|   |       |       |   |
|   |   · - · - ●   |   |
|   |   |       |   |   |
· - ○ - ○       ● - ○ - ·
|   |   |       |   |   |
|   |   · - · - ●   |   |
|   |       |       |   |
|   ○ - - - ● - - - ○   |
|           |           |
· - - - - - ● - - - - - ·
```

Характерно за играта "Дама" е простотата и бързината на подготовката. Дъската се прави лесно с картон, молив и линийка – чертаят се три квадрата един в друг, с разстояние 5 – 6 сантиметра и отсечки, свързващи средите на страните на квадратите. Може да се начертае и в пясъка на плажа. За пулове може да се ползват всякакви подръчни средства – пионки, копчета, камъчета, мидички – девет бели, плюс девет с друг цвят.

# Интерфейс на играта:

Така трябва да изглежда една празна дъска за игра на дама, която може да бъде лесно отпечатана в конзола.

```
·-----------·-----------·
|           |           |
|   ·-------·-------·   |
|   |       |       |   |
|   |   ·---·---·   |   |
|   |   |       |   |   |
·---·---·       ·---·---·
|   |   |       |   |   |
|   |   ·---·---·   |   |
|   |       |       |   |
|   ·-------·-------·   |
|           |           |
·-----------·-----------·
```

* Място, което **не** е заето от пул, се отбелязва с `·`;
* Белите пулове се маркират със специалният символ: `○`;
* Черните пулове се маркират с: `●`;
* Хоризонталните линии, по които могат да се движат пуловете, се отбелязват с тирета `-`;
* Вертикалните линии, по които могат да се движат пуловете, се отбелязват с: `|`.

Белите и черните пулове заместват празните места при "поставяне" върху дъската.

# Задачи по проект №1:
Да се имплементирт:
* Правилата на играта;
* Поставяне по дъската ще се оцъществява чрез подаване на координати. Хоризонтално координатите могат да бъдат A, B, C, D, E, F или G. Съответно вертиналните позиции могат да бъдат 1, 2, 3, 4, 5, 6 или 7. Имайте предвид, че позиции като А2 са невалидни. За повече информация моля погледнете тази визуалицация на дъска с координати:

```
    A   B   C   D   E   F   G
   
1   ·-----------·-----------·
    |           |           |
2   |   ·-------·-------·   |
    |   |       |       |   |
3   |   |   ·---·---·   |   |
    |   |   |       |   |   |
4   ·---·---·       ·---·---·
    |   |   |       |   |   |
5   |   |   ·---·---·   |   |
    |   |       |       |   |
6   |   ·-------·-------·   |
    |           |           |
7   ·-----------·-----------·
```

* Местене на пул се осъществява чрез запис на два последователни координати. Пример: А1А4 (пул в горният ляв ъгъл се мести на дясно).
* При появила се "дама", трябва да се поискат координати на пул на опонента за премахване;
* Подаване на входящи координати към изпълнителят на проект №2;
* Грешки при невалидно въведени данни;
* Отпечатване на игровата дъска с позициите на пуловете в началото на играта и след всеки изигран ход;
* Отпечатване на победител или равен при край на играта (играч не може да премести пул или някой от играчите остане с 2 пула).

# Задачи по проект №2:
Да се имплементира:
* Запис на входящи координати (например А4 - поставяне на пул, А1А4 - местене на пул). Координатите трябва да бъдат подавани от изпълнителят на проект №1;
* Подаване на координати за поставяне на пул или местенето на вече поставен. Подадените координати трябва да целят да се направи "дама" или да попречи създавенето на такава от противника, спрямо досегашните ходове от двете страни и правилата на играта;

Източник правила: [Wikipedia](https://bg.wikipedia.org/wiki/%D0%94%D0%B0%D0%BC%D0%B0_%28%D0%B8%D0%B3%D1%80%D0%B0%29)