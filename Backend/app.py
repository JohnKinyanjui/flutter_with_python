from flask import Flask, jsonify,request

app = Flask(__name__)
stores = [
    {
    'name' :'Shoes Store',
    'ratings':'8.4',
    'image':'https://cdn.pixabay.com/photo/2016/04/12/14/08/shoe-1324431_960_720.jpg',
    'items':[
        {
        'item_name' :'Nike 510',
        'item_image':'https://cdn.pixabay.com/photo/2015/05/31/10/54/shoes-791044_960_720.jpg',
        'item_price':'$500.0',
    }
    ]
    },
    {
        'name' :'Soko',
        'ratings':'8.4',
        'image':'https://cdn.pixabay.com/photo/2017/06/17/09/47/shopping-2411667_960_720.jpg',
        'items':[
            {
                'item_name' :'Nike 510',
                'item_image':'https://cdn.pixabay.com/photo/2015/05/31/10/54/shoes-791044_960_720.jpg',
                'item_price':'$500.0',
            }
        ]
    },
    {
        'name' :'Shoes Store',
        'ratings':'8.4',
        'image':'https://cdn.pixabay.com/photo/2014/05/03/01/02/concert-336695_960_720.jpg',
        'items':[
            {
                'item_name' :'Nike 510',
                'item_image':'https://cdn.pixabay.com/photo/2015/05/31/10/54/shoes-791044_960_720.jpg',
                'item_price':'$500.0',
            }
        ]
    }
]

@app.route('/store')
def get_stores():
    return jsonify({'stores': stores})

app.run(debug=True, host="192.168.43.39")



# 192.168.43.39
# accessing Ipv4
# ipconfig
