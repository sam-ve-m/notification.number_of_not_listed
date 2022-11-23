# Jormungandr - Notification
from ...repositories.mongo_db.notification.repository import NotificationRepository


class NotificationCountService:
    @classmethod
    async def get_number_of_not_listed(cls, unique_id: str) -> int:
        number_of_not_listed = await NotificationRepository.count_notifications_not_listed(
            unique_id=unique_id
        )
        return number_of_not_listed
