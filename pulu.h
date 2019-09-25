#ifndef PULU_H
#define PULU_H

#include <QObject>
#include <QTcpSocket>

#if defined(TARGET_ARM)
#define PULU_IP "192.168.20.1"
#else
#define PULU_IP "192.168.1.236"
#endif
#define PULU_PORT   22222


class Pulu : public QObject
{
    Q_OBJECT

public:
    explicit Pulu(QObject *parent = nullptr);
    ~Pulu();

    static Pulu *instance(void);

    /// @brief: Moves pulu forward to the given coordinates
    Q_INVOKABLE void moveForwardTo(int x, int y);

    /// @brief: Moves pulu backward to the given coordinates
    Q_INVOKABLE void moveBackwardTo(int x, int y);

signals:

public slots:

private slots:
    void onConnected(void);
    void onError(QAbstractSocket::SocketError);

private:
    QTcpSocket socket;
};

#endif // PULU_H
