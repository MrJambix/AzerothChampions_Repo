const Transmogrification = {
    timeout: null,

    ChangeRealm: function (realmElement, characterElement) {
        const realmId = $(`select[id="${realmElement}"]`).val();
        if (typeof $.fn.selectbox === 'function') {
            $(`[data-${characterElement}]`).each(function () {
                $(this).next().hide();
            });
            $(`select[id="${characterElement}-${realmId}"]`).next().show();

        } else {
            document.querySelectorAll(`[data-${characterElement}]`).forEach((element) => {
                element.style.display = 'none';
            });
            document.querySelectorAll(`select[id="${characterElement}-${realmId}"]`).forEach((element) => {
                element.style.display = 'block';
            });
        }
        Transmogrification.toggleClass(99);
    },

    toggleClass: function (id) {
        $('.class-nav-item.active').removeClass('active');
        document.querySelector(`[data-category="${id}"]`).classList.add('active');
        const realm = $('select[id="realm-changer"]').val();
        $.fn.dataTable.ext.errMode = 'none';

        $('#transmog-list')
            .on('error.dt', function (e, settings, techNote, message) {
                var result = message.toString().replace('DataTables warning: table id=transmog-list - ', '')
                $('#transmog-list_processing').hide();
                $('.dataTables_empty').text(result);
            })
            .DataTable({
                "destroy": true,
                "lengthChange": false,
                "processing": true,
                "fnDrawCallback": function () {
                    Tooltip.refresh();

                    // re-Apply iCheck and selectbox
                    if (typeof App === 'object') {
                        if (typeof App.initIcheck === 'function')
                            App.initIcheck(true);
                    }
                    const myLazyLoad = new LazyLoad();
                    myLazyLoad.update();
                },
                "ajax": {
                    "url": Config.URL + "transmogrification/getTransmogList",
                    "type": "POST",
                    "data": function (d) {
                        d.realm = realm;
                        d.class = id;
                        d.csrf_token_name = Config.CSRF;
                    }
                },
                "columnDefs": [
                    {"orderable": false, "targets": 0},
                    {"className": "multiline", "targets": 1},
                    {"className": "text-center", "targets": 2},
                    {"className": "text-center", "targets": 3},
                    {"className": "text-center", "orderable": false, "targets": 4}
                ],
                "columns": [
                    {
                        "data": "SET", "render": function (data, type, row, meta) {
                            return '<a href="https://www.wowhead.com/transmog-set=' + row.transmog_set + '"><img class="lazy" data-src="https://wow.zamimg.com/modelviewer/live/webthumbs/transmog/10/1/' + (row.transmog_set & 255) + '/' + row.transmog_set + '.webp" style="width: 154px;"></a>';
                        }
                    },
                    {
                        "data": "NAME", "render": function (data, type, row, meta) {
                            return row.name;
                        }
                    },
                    {
                        "data": "TYPE", "render": function (data, type, row, meta) {
                            return row.type;
                        }
                    },
                    {
                        "data": "PRICE", "render": function (data, type, row, meta) {
                            return '<img src="' + Config.URL + 'application/images/icons/coins.png" align="absmiddle"> ' + row.dp + ' DP | <img src="' + Config.URL + 'application/images/icons/lightning.png" align="absmiddle">' + row.vp + ' VP | <span class="moneygold">' + row.gold / 1000 + 'K</span>';
                        }
                    },
                    {
                        "data": "", "render": function (data, type, row, meta) {
                            return '<a href="javascript:void(0)" onClick="Transmogrification.buyItem(' + row.id + ')" title="Purchase"><i class="fa fa-shopping-cart" title="Purchase"></i> Buy</a>';
                        }
                    }
                ]
            });
    },

    Search: function (id) {
        const table = $('#transmog-list').DataTable();

        $('#search_field').on('keyup', function () {
            table.search(this.value).draw();
        });
    },

    buyItem: function (id) {
        Swal.fire({
            title: 'Which one do you want to pay with?',
            icon: 'question',
            input: 'select',
            inputOptions: {
                'dp': 'DP',
                'vp': 'VP',
                'gold': 'Gold'
            },
            inputPlaceholder: 'Select the payment method',
            showCancelButton: true,
            inputValidator: function (value) {
                return new Promise(function (resolve, reject) {
                    if (value !== '') {
                        resolve();
                    } else {
                        resolve('You need to select a payment method');
                    }
                });
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const Type = result.value;

                const realm = $('select[name="realm-changer"]').val();
                const character = $(`select[name="characterChanger-${realm}"]`).val();

                clearTimeout(Transmogrification.timeout);
                Transmogrification.timeout = setTimeout(function () {
                    const postData = {
                        "realm": realm,
                        "character": character,
                        "id": id,
                        "price": Type,
                    };

                    $.post(Config.URL + "transmogrification/buyTransmog", postData, function (data) {
                        try {
                            data = JSON.parse(data);

                            Swal.fire({
                                text: data.text,
                                icon: data.icon,
                            });
                        } catch (e) {
                        }
                    });

                }, 500);
            }
        });
    },
};