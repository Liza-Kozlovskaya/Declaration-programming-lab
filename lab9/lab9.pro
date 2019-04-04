domains
  treetype = tree(integer, treetype, treetype); empty
  
predicates
  print_tree(treetype, integer) /*display tree and it subtree*/
  print_spaces(integer) /*depth or lvl subtree*/ 
  select_subtree_and_insert(treetype, integer, treetype) /*entering a number and adding it to the subtree*/
  insert_into_subtree(treetype, integer, integer, treetype) /*tree navigation and number insertion*/
  remove_subtree(treetype, treetype) /*remove subtree*/
  menu(integer, treetype) /*option selection*/
  
clauses
  print_tree(empty, _Depth):-!. /*If tree is empty that interruption*/
  print_tree(tree(TopValue, Left, Right), Depth):-
    SubtreesDepth = Depth + 1, /*subtree depth calculation*/
    print_tree(Left, SubtreesDepth),
    print_spaces(Depth), write(TopValue), write("<"), nl,
    print_tree(Right, SubtreesDepth).
    
  print_spaces(SpaceNumber):-
    SpaceNumber <= 0, !;
    write("\t"),
    TailSpaceNumber = SpaceNumber - 1,
    print_spaces(TailSpaceNumber).
    
  select_subtree_and_insert(empty, Value, tree(Value, empty, empty)):-!.
  select_subtree_and_insert(Tree, Value, TreeWithValue):-
    print_tree(Tree, 0),
    write("enter: \n\t0 - into left subtree\n\t1 - into right subtree\n: "), 
    readint(LeftOrRight), 
    insert_into_subtree(Tree, LeftOrRight, Value, TreeWithValue).
    
  insert_into_subtree(tree(TopValue, Left, Right), 0, Value, tree(TopValue, LeftWithValue, Right)):-
    select_subtree_and_insert(Left, Value, LeftWithValue), !.
  insert_into_subtree(tree(TopValue, Left, Right), 1, Value, tree(TopValue, Left, RightWithValue)):-
    select_subtree_and_insert(Right, Value, RightWithValue), !.
  insert_into_subtree(Tree, _BadSubtree, Value, TreeWithValue):-
    write("you select wrong number"), nl,
    select_subtree_and_insert(Tree, Value, TreeWithValue).
    
  remove_subtree(empty, empty):-!.
  remove_subtree(tree(_TopValue, empty, empty), empty):-!.
  remove_subtree(Tree, empty):-
    print_tree(Tree, 0),
    write("remove this subtree?"), 
    readint(Select), Select = 1, !.
  remove_subtree(tree(TopValue, Left, Right), tree(TopValue, LeftWithoutSubtree, Right)):-
    write("select subtree for remove (left = 0, right = other value): "),
    readint(Select), Select = 0, !, 
    remove_subtree(Left, LeftWithoutSubtree).
  remove_subtree(tree(TopValue, Left, Right), tree(TopValue, Left, RightWithoutSubtree)):-
      remove_subtree(Right, RightWithoutSubtree).
  
  menu(0, Tree):-
    write("enter:\n"),
    write("\t1 - print tree\n"),
    write("\t2 - add node into tree\n"),
    write("\t3 - remove subtree:\n"),
    write("\t4 - clear tree\n"),
    write("\t0 - exit"), nl,
    write(": "),
    readint(Select), !, /*reading the number in the menu and executing the command under this number*/
    Select <> 0, menu(Select, Tree).
  menu(1, Tree):-
    print_tree(Tree, 0), nl,  /*display tree and it subtree*/
    			     /*tree display from left to right*/
    !, menu(0, Tree).
    /**************************************************/
  menu(2, Tree):-		/*function add subtree*/
    write("enter value for insert: "), 
    readint(Value), !,
    select_subtree_and_insert(Tree, Value, TreeWithValue),
    menu(0, TreeWithValue). /*edit tree on new*/
    /**************************************************/
  menu(3, Tree):-
    remove_subtree(Tree, TreeWithoutSubtree), /*function delete subtree*/
    !, menu(0, TreeWithoutSubtree).
    /**************************************************/
  menu(4, _Tree):-
    menu(0, empty), !. /*assign emptiness to the tree*/
    /**************************************************/
  menu(_, Tree):-   /*stop program and exit*/
    write("you enter bad menu point"), nl,
    !, menu(0, Tree).
    
goal
  menu(0, empty).