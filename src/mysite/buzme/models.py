from django.db import models

class Merchant(models.Model):
    merchant_name = models.CharField(max_length=200)
#    logo = models.ImageField(upload_to='image') # http://www.pythonware.com/products/pil/ http://scottbarnham.com/blog/2007/07/31/uploading-images-to-a-dynamic-path-with-django/
    contact_first_name = models.CharField(max_length=30)
    contact_last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=200)
    phone = models.CharField(max_length=200)
    url = models.CharField(max_length=200)
    #
    create_date = models.DateTimeField('date created')
    update_date = models.DateTimeField('date updated')
    #
    def __unicode__(self):
        return self.merchant_name

class Patron(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=200)
    phone = models.CharField(max_length=200)
    #
    create_date = models.DateTimeField('date created')
    update_date = models.DateTimeField('date updated')
    #
    def __unicode__(self):
        return self.first_name % self.last_name

class Queue(models.Model):
    merchant = models.ForeignKey(Merchant)
    patron = models.ForeignKey(Patron)
    size = models.IntegerField()
    enqueue_date = models.DateTimeField('date enqueued')
    notify_date = models.DateTimeField('date notified')
    cancel_date = models.DateTimeField('date cancelled')
    dequeue_date = models.DateTimeField('date dequeued')
    status = models.CharField(max_length=30) # ENQUEUED, CANCELLED, NOTIFIED, DEQUEUED
    #
    create_date = models.DateTimeField('date created')
    update_date = models.DateTimeField('date updated')
    #
    def __unicode__(self):
        return self.patron

