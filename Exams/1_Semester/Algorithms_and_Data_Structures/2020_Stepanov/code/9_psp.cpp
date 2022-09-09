bool isPSP(std::string s) {
    std::stack <char> st;
    for (int i = 0; i < s.size(); ++i) {
        if (isOpen(s[i])) { //если это открывающая скобка
            st.push(s[i]); //добавляем в стек
        } else { //если закрывающая
            if (!st.empty() && st.top() = getOpen(s[i])) { //если верхняя скобка есть и имеет такой же тип, что текущая
                st.pop(); //извлекаем ее из стека
            } else { //иначе
                return false; //это не ПСП
            }
        }
    }
    if (st.empty()) { //если для всех скобок нашлась пара
        return true; //это ПСП
    } else { //иначе
        return false; //это не ПСП
    }
};

