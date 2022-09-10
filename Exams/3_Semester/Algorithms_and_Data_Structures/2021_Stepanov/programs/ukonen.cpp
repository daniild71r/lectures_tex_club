for c in s {
    while (из curr нет перехода по c) {
        создаем переход из curr: [c, $]
        curr = getLink(curr);
    }
    curr = go(curr[c]) // смещаем терминальность
}
