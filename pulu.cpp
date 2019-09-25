#include "pulu.h"
//#include "robotsoft/tcp_parser.h"
#include <stdio.h>
#include "ui.h"


Pulu::Pulu(QObject *parent) : QObject(parent)
{
    connect(&this->socket, &QTcpSocket::connected, this, &Pulu::onConnected);
    connect(&this->socket, SIGNAL(error(QAbstractSocket::SocketError)), this, SLOT(onError(QAbstractSocket::SocketError)));

    qDebug("Trying to connect to pulu at IP '" PULU_IP "'");
    this->socket.setSocketOption(QTcpSocket::KeepAliveOption, 1);
    this->socket.connectToHost(PULU_IP, 22222, QTcpSocket::ReadWrite, QTcpSocket::IPv4Protocol);
}

Pulu::~Pulu()
{
    if (this->socket.isOpen()) {
        qDebug("Pulu disconnected");
        this->socket.close();
    }
}

Pulu *Pulu::instance()
{
    static Pulu p;
    return &p;
}

void Pulu::moveForwardTo(int x, int y)
{
    qDebug("moving forward to %i %i", x, y);
}

void Pulu::moveBackwardTo(int x, int y)
{
    qDebug("moving backward to %i %i", x, y);
}

void Pulu::onError(QAbstractSocket::SocketError)
{
    qDebug("Connecting to pulu failed: '%s'", this->socket.errorString().toStdString().c_str());
}

void Pulu::onConnected()
{
    qDebug("Connected to pulu at " PULU_IP);
}

