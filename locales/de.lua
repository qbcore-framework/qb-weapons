local Translations = {
    error = {
        canceled = 'Abgebrochen',
        max_ammo = 'Maximale Munitionskapazität',
        no_weapon = 'Du hast keine Waffe.',
        wrong_ammo = 'Der Munitionstyp ist falsch.',
        no_support_attachment = 'Diese Waffe unterstützt diesen Aufsatz nicht.',
        no_weapon_in_hand = 'Du hast keine Waffe in der Hand.',
        weapon_broken = 'Diese Waffe ist kaputt und kann nicht verwendet werden.',
        no_damage_on_weapon = 'Die Waffe hat keine Schäden...',
        weapon_broken_need_repair = 'Deine Waffe ist kaputt, du musst sie reparieren, bevor du sie wieder benutzen kannst.',
        attachment_already_on_weapon = 'Du hast bereits ein %{value} auf deiner Waffe.'
    },
    success = {
        reloaded = 'Nachgeladen'
    },
    info = {
        loading_bullets = 'Lade Kugeln',
        repairshop_not_usable = 'Die Werkstatt ist momentan ~r~NICHT~w~ benutzbar.',
        weapon_will_repair = 'Deine Waffe wird repariert.',
        take_weapon_back = '[E] - Waffe nehmen',
        repair_weapon_price = '[E] Repariere die Waffe für:, ~g~$%{value}~w~',
        removed_attachment = 'Du hast %{value} von deiner Waffe entfernt!',
        hp_of_weapon = 'Haltbarkeit deiner Waffe'
    },
    mail = {
        sender = 'Tyrone',
        subject = 'Reparatur',
        message = 'Dein %{value} ist repariert. Du kannst es am angegebenen Ort abholen. <br><br> Peace out, Madafaka'
    },
}

if GetConvar('qb_locale', 'en') == 'de' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
