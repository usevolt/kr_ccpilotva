#include "pulu.h"
#include <stdio.h>

Pulu::Pulu(QObject *parent) : QObject(parent)
{

}

Pulu::~Pulu()
{

}

void Pulu::moveForwardTo(int x, int y)
{
    printf("moving to %i %i\n", x, y);
}

