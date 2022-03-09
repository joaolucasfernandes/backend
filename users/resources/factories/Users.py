

def factory_new_user():

    return {
        'name': 'Thais kkkk',
        'email': 'bartonkkk@kkkk.com',
        'password': 'pwd123'
    }

def factory_get_user():

    return {
        'name': 'Pedro onofre',
        'email': 'bartoeen@seehield.com',
        'password': 'pwd123'
    }


def factory_user_session(target):

    name = 'Paula Onofrinho'
    email = 'paulinha.jampa@hotmail.com'
    password = 'pwd123'

    data = {
        'signup': {
            'name': name,
            'email': email,
            'password': password
        },
        'login': {
            'email': email,
            'password': password
        }
    }

    return data[target]