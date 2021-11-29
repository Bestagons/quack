from firebase_admin import messaging


def notify_one(token: str, title: str, body: str) -> str:
    """

    :param token: The registration token of the device to which the message should be sent
    :param title: Notification title
    :param body: Notification body
    :return:
    Returns:
        string: A message ID string that uniquely identifies the sent message.
    """
    message = messaging.Message(
        notification=messaging.Notification(
            title=title,
            body=body
        ),
        token=token
    )
    return messaging.send(message)


def notify_multiple(tokens: list, title: str, body: str) -> str:
    """

    :param tokens: The registration token of the device to which the message should be sent
    :param title: Notification title
    :param body: Notification body
    :return:
    Returns:
        string: A message ID string that uniquely identifies the sent message.
    """
    message = messaging.MulticastMessage(
        tokens=tokens,
        notification=messaging.Notification(
            title=title,
            body=body
        )
    )
    return messaging.send(message)
