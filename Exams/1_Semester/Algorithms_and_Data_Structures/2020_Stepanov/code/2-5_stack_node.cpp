struct node {   //структура каждой ячейки
	int val;    //значение в ячейке
	node* prev; //указатель на предыдущую ячейку
	node(node* prev, int value) : prev(prev), val(value) {}
};

int main()
{
	node* stack = nullptr; //создание стека
	//добавление элемента x
	stack = new node(stack, x);

	//удаление элемента последнего элемента
	node* node = stack;
	stack = stack->prev;
	delete node;
}