from flask_wtf import FlaskForm
from wtforms import TextField, PasswordField

## login and registration


class LoginForm(FlaskForm):
    username = TextField('Имя пользователя', id='username_login')
    password = PasswordField('Пароль', id='pwd_login')


class CreateAccountForm(FlaskForm):
    username = TextField('Имя пользователя', id='username_create')
    email = TextField('Email')
    password = PasswordField('Пароль', id='pwd_create')
