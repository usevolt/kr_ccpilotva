#include "ui.h"

Ui::Ui(QObject *parent) : QObject(parent)
{

}

Ui::~Ui()
{

}


Ui *Ui::instance()
{
    static Ui ui;
    return &ui;
}

