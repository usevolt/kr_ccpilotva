#ifndef UI_H
#define UI_H

#include <QObject>

class Ui : public QObject
{
    Q_OBJECT
public:
    ~Ui();

    static Ui *instance(void);

signals:
    void statusLog(QString str);

public slots:

private:
    explicit Ui(QObject *parent = 0);
};

#endif // UI_H
