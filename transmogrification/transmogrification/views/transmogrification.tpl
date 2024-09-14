<script src="./node_modules/vanilla-lazyload/dist/lazyload.min.js"></script>
<div class="row">
    <div id="left" class="col-sm-12 col-lg-10">
        {lang("realm", "transmogrification")}:
        <select style="width: 200px;" name="realm-changer" id="realm-changer" onchange="return Transmogrification.ChangeRealm('realm-changer', 'characterChanger');">
            {foreach from=$realms->getRealms() item=realm}
                <option value="{$realm->getId()}">{$realm->getName()}</option>
            {/foreach}
        </select>
        {lang("character", "transmogrification")}:
        {foreach from=$characters item=realm}
            <select style="width: 200px;{if !$realm@first}display:none{/if}" name="characterChanger-{$realm.realmId}" id="characterChanger-{$realm.realmId}" data-characterChanger>
                {foreach from=$realm.characters item=character}
                    <option value="{$character.guid}">{$character.name}</option>
                {/foreach}
            </select>
        {/foreach}
    </div>
</div>
<div class="row mt-4">
    <div id="left" class="col-sm-12 col-lg-2">
        <input type="text" placeholder="{lang("search", "transmogrification")}" id="search_field" onkeyup="Transmogrification.Search()">
        <ul class="class-navbar-nav mt-2">
            <li class="class-nav-item active" data-category="99">
                <a href="javascript:void(0)" class="class-nav-link" onClick="Transmogrification.toggleClass('99')" title="All"><i class="dot"></i><span>All</span></a>
            </li>
            {foreach from=$class_list key=key item=class}
                <li class="class-nav-item" data-category="{$key}">
                    <a href="javascript:void(0)" class="class-nav-link color-c{$key}" onClick="Transmogrification.toggleClass('{$key}')" title="{$class}"><i class="dot"></i><span>{$class}</span></a>
                </li>
            {/foreach}
        </ul>
    </div>
    <div id="right" class="col-sm-12 col-lg-10">
        <div class="table-responsive text-nowrap">
            <table class="nice_table" id="transmog-list">
                <thead>
                <tr>
                    <th scope="col" class="h4"></th>
                    <th scope="col" class="h4 text-center">{lang("name", "transmogrification")}</th>
                    <th scope="col" class="h4 text-center">{lang("type", "transmogrification")}</th>
                    <th scope="col" class="h4 text-center">{lang("price", "transmogrification")}</th>
                    <th scope="col" class="h4 text-center"></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td colspan="5" class="text-center">{lang("loading", "transmogrification")}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $(window).on("load", function () {
        Transmogrification.toggleClass(99);
    });
</script>