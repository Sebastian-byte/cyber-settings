#ifndef ABOUT_H
#define ABOUT_H

#include <QObject>
#include <QString>
#include <QSysInfo>
#include <qqml.h>

class About : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString osName READ osName NOTIFY stub)
    Q_PROPERTY(QString kernelVersion READ kernelVersion NOTIFY stub)
    Q_PROPERTY(QString hostname READ hostname NOTIFY stub)
    Q_PROPERTY(QString userName READ userName NOTIFY stub)
    Q_PROPERTY(QString memorySize READ memorySize NOTIFY stub)


    QML_ELEMENT

public:
    explicit About(QObject *parent = nullptr);

    QString osName();
    QString kernelVersion();
    QString hostname();
    QString userName();
    QString settingsVersion();
    QString memorySize();

    QString developers();

private:
    qlonglong calculateTotalRam() const;

// Only here so that QML doesn't whine about non-NOTIFYable properties.
signals:
    void stub();
};

#endif // ABOUT_H
