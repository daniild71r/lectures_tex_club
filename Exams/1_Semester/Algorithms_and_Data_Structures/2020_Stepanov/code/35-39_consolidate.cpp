struct node {
    int degree; //количество детей
    int value; //значение
    //...
    bool mark; //true если у вершины был вырезан хотя бы 1 сын
};
//roots - список корней
void consolidate() {
    //заводим newRoots[0..D(n)], где D(n) - максимальная степень корня в куче из n элементов
    for root in roots { //проходим по всем деревьям
        tree = root; //создаем временную переменную
        while (newRoots[tree->degree] != nullptr) { //пока дерево с такой степенью уже есть
             unite(tree, newRoots[root->degree]); //подвешиваем его к нашему дереву как сына (degree увеличится, а значит перейдем к новой ячейке)
             newRoots[tree->degree - 1] = nullptr; //удаляем дерево, которое подвесили
        }
        newRoots[tree->degree] = tree; //записываем на свободное место
    }
    roots = newRoots;//обновляем список корней
}