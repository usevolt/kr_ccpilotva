#ifndef PULU_H
#define PULU_H

#include <QObject>



class Pulu : public QObject
{
    Q_OBJECT
public:
    explicit Pulu(QObject *parent = nullptr);
    ~Pulu();

    Q_INVOKABLE void moveForwardTo(int x, int y);

signals:

public slots:

private:

};

#endif // PULU_H
