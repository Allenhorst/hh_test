from sqlalchemy import Column, Integer, REAL, String
from sqlalchemy.ext.declarative import declarative_base

from flask import json
from app import db, login_manager
from flask_login import UserMixin
from flask import Response
from sqlalchemy import Column, Integer, String, BLOB, REAL
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.ext.declarative import DeclarativeMeta


class AlchemyEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj.__class__, DeclarativeMeta):
            # an SQLAlchemy class
            fields = {}
            for field in [x for x in dir(obj) if not x.startswith('_') and x != 'metadata']:
                data = obj.__getattribute__(field)
                try:
                    json.dumps(data)  # this will fail on non-encodable values, like other classes
                    fields[field] = data
                except TypeError:
                    fields[field] = None
            # a json-encodable dict
            return fields

        return json.JSONEncoder.default(self, obj)


Base = declarative_base()


class ObjectsS(db.Model):
    __tablename__ = "Objects_S"

    id = Column(Integer, primary_key=True)
    user_id = Column(Integer)
    object_number = Column(Integer)
    name = Column(String(120))
    enabled = Column(Integer)
    lat = Column(REAL)
    lon = Column(REAL)

    # def __init__(self, user_id, object_number, name, enabled, lat, lon):
    #     self.user_id = user_id
    #     self.object_number = object_number
    #     self.name = name
    #     self.enabled = enabled
    #     self.lat = lat
    #     self.lon = lon

    def fill_class(self, user_id, object_number, name, enabled, lat, lon):
        self.user_id = user_id
        self.object_number = object_number
        self.name = name
        self.enabled = enabled
        self.lat = lat
        self.lon = lon

    def __init__(self, **kwargs):
        for attribute, value in kwargs.items():
            # depending on whether value is an iterable or not, we must
            # unpack it's value (when **kwargs is request.form, some values
            # will be a 1-element list)
            if hasattr(value, '__iter__') and not isinstance(value, str):
                # the ,= unpack of a singleton fails PEP8 (travis flake8 test)
                value = value[0]
            setattr(self, attribute, value)

    # def __repr__(self):
    #     return self

    # def __repr__(self):
    #     return "User_id: '%i', " \
    #            "Object_number: '%i', " \
    #            "Name: '%s, Enabled: '%i', " \
    #            "Lat: '%r', " \
    #            "Lon: '%r'" % \
    #            (self.user_id, self.object_number, self.name, self.enabled, self.lat, self.lon)

    def __repr__(self):
        return "'%i','%i','%s'" % (self.user_id, self.object_number, self.name)

    def to_json(self):
        return json.dumps(self, cls=AlchemyEncoder)


class MessageETHContactID(db.Model):
    __tablename__ = "Message_ETH_ContactID"

    id = Column(Integer, primary_key=True)
    message = Column(String(120))
    user_id = Column(Integer)
    device_uid_id = Column(String(120))
    object_number = Column(Integer)
    type_message = Column(Integer)
    contact_code = Column(Integer)
    razdel_number = Column(Integer)
    zone_number = Column(Integer)
    time_stamp = Column(String(120))

    def fill_class(self, message, user_id, device_uid_id, object_number, type_message, contact_code, razdel_number,
                   zone_number, time_stamp):
        self.message = message
        self.user_id = user_id
        self.device_uid_id = device_uid_id
        self.object_number = object_number
        self.type_message = type_message
        self.contact_code = contact_code
        self.razdel_number = razdel_number
        self.zone_number = zone_number
        self.time_stamp = time_stamp

    def __init__(self, **kwargs):
        for attribute, value in kwargs.items():
            # depending on whether value is an iterable or not, we must
            # unpack it's value (when **kwargs is request.form, some values
            # will be a 1-element list)
            if hasattr(value, '__iter__') and not isinstance(value, str):
                # the ,= unpack of a singleton fails PEP8 (travis flake8 test)
                value = value[0]
            setattr(self, attribute, value)

    def __repr__(self):
        return self

    def to_json(self):
        return json.dumps(self, cls=AlchemyEncoder)


class AdemcoCode(db.Model):
    __tablename__ = "Ademco_Code"

    id = Column(Integer, primary_key=True)
    code_id = Column(Integer)
    text_code = Column(String(120))
    type_message = Column(Integer)

    def fill_class(self, code_id, text_code, type_message):
        self.type_message = type_message
        self.text_code = text_code
        self.code_id = code_id

    def __init__(self, **kwargs):
        for attribute, value in kwargs.items():
            # depending on whether value is an iterable or not, we must
            # unpack it's value (when **kwargs is request.form, some values
            # will be a 1-element list)
            if hasattr(value, '__iter__') and not isinstance(value, str):
                # the ,= unpack of a singleton fails PEP8 (travis flake8 test)
                value = value[0]
            setattr(self, attribute, value)

    def __repr__(self):
        return self

    def to_json(self):
        return json.dumps(self, cls=AlchemyEncoder)


# class User(Base):
#     __tablename__ = "User"
#
#     id = Column(Integer, primary_key=True)
#     username = Column(String(120), unique=True)
#     email = Column(String(120), unique=True)
#     password = Column(String(120))
#
#     def __init__(self, username, email, password):
#         self.username = username
#         self.email = email
#         self.password = password
#
#     def __repr__(self):
#         return str(self.username)

# class User(Base):
class User(db.Model, UserMixin):
    __tablename__ = "User"

    id = Column(Integer, primary_key=True)
    username = Column(String(120), unique=True)
    email = Column(String(120), unique=True)
    password = Column(String(120))

    # def __init__(self, username, email, password):
    #     self.username = username
    #     self.email = email
    #     self.password = password

    def __init__(self, **kwargs):
        for attribute, value in kwargs.items():
            # depending on whether value is an iterable or not, we must
            # unpack it's value (when **kwargs is request.form, some values
            # will be a 1-element list)
            if hasattr(value, '__iter__') and not isinstance(value, str):
                # the ,= unpack of a singleton fails PEP8 (travis flake8 test)
                value = value[0]
            setattr(self, attribute, value)

    def fill_class(self, username, email, password):
        self.username = username
        self.email = email
        self.password = password

    def __repr__(self):
        return str(self.username)


@login_manager.user_loader
def user_loader(identifier):
    return User.query.filter_by(id=identifier).first()


@login_manager.request_loader
def request_loader(request):
    username = request.form.get('username')
    user = User.query.filter_by(username=username).first()
    return user if user else None


def get_key(custom):
    print(custom[0].id)
    return custom[0].id
