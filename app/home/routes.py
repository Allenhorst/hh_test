from app.home import blueprint
from flask import render_template
from flask import request
from app.base.models import *
#from server.ModelTable import *
from app import db
from flask_login import (
    current_user,
    login_required
)


@blueprint.route('/index')
@login_required
def index():
    return render_template('index.html')


@blueprint.route('/GetObject', methods=['GET', 'POST'])
@login_required
def get_object():
    data = db.session.query(ObjectsS)
    content = request.form.to_dict()
    data = data.filter(ObjectsS.object_number == content['id_object']).limit(1).all()
    # newObject = Objects_S(
    #    id=None,
    #    User_id =current_user.id,
    #    Object_number=content['id_object'],
    #    Name=content['name_object'],
    #    Enabled=content['Enabled'],
    #    lat=content['lat'],
    #    lon=content['lon']
    #    )
    # db.session.add(newObject)
    # db.session.commit()
    print(json.dumps(data, cls=AlchemyEncoder))
    return json.dumps(data, cls=AlchemyEncoder)


@blueprint.route('/Add', methods=['GET', 'POST'])
@login_required
def add():
    print(current_user.id)
    content = request.form.to_dict()
    print(content)
    new_object = ObjectsS(
        current_user.id,
        content['id_object'],
        content['name_object'],
        content['Enabled'],
        content['lat'],
        content['lon']
    )
    db.session.add(new_object)
    db.session.commit()
    return json.dumps("success")


# @blueprint.route('/<template>')
# @login_required
# def route_template(template):
#    return render_template(template + '.html')


@blueprint.route('/<template>')
@login_required
def route_template(template):
    if template == "getjsondata":
        data = db.session.query(MessageETHContactID, AdemcoCode, ObjectsS)
        data = data.join(AdemcoCode, MessageETHContactID.contact_code == AdemcoCode.code_id). \
            filter(
            (MessageETHContactID.type_message == AdemcoCode.type_message))
        data = data.join(ObjectsS, MessageETHContactID.object_number == ObjectsS.object_number)
        data.order_by(MessageETHContactID.id.desc()).limit(10000).all()
        data = sorted(data, key=get_key, reverse=True)

        J = "["
        for d in data:
            J += json.dumps(d, cls=AlchemyEncoder) + ","
        J = J[:-1]
        J += "]"
        # print(J)
        resp = Response(J, status=200, mimetype='application/json')
        resp.headers['Link'] = 'http://ivs.com'

        return resp
    if template == "getjsondataobj":
        data = db.session.query(ObjectsS)
        data.all()
        J = "["
        for d in data:
            J += json.dumps(d, cls=AlchemyEncoder) + ","
        J = J[:-1]
        J += "]"
        # print(J)
        resp = Response(J, status=200, mimetype='application/json')
        resp.headers['Link'] = 'http://ivs.com'

        return resp
    messages = db.session.query(MessageETHContactID).order_by(MessageETHContactID.id.desc()).limit(100)
    return render_template(template + '.html')
