/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function () {
    $('#mydatatable').dataTable({
        'paging': true,
        'lengthChange': true,
        'searching': true,
        'ordering': true,
        'info': true,
        'autoWidth': true,
        'language': {
            'info': '<br/>Copyright © 2021 SYGEALOC',
            'infoEmpty': '',
            'processing': 'Traitement...',
            'loadingRecords': 'Chargement...',
            'search': 'Rechercher',
            'zeroRecords': 'Aucune donn&eacute;e enregistr&eacute;e',
            'lengthMenu': "Affichage d'au plus  _MENU_ enregistrements",
            'infoFiltered': '',
            'paginate': {
                'first': 'Premier',
                'last': 'Dernier',
                'next': 'Suivant',
                'previous': 'Pr&eacute;cedent'
            }
        }
    });
});