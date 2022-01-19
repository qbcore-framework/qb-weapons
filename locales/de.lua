local Translations = {
    error = {
        canceled = 'Abgebrochen',
        max_ammo = 'Maximale Munitions Kapazität',
        no_weapon = 'Du hast keine Waffe.',
        no_support_attachment = 'Diese waffe ist nicht mit diesem Komponenten Kompatibel.',
        no_weapon_in_hand = 'Du hast keine Waffe in der Hand.',
        weapon_broken = 'Diese Waffe ist kapput und kann nicht Benutzt Werden.',
        no_damage_on_weapon = 'Diese Waffe ist nicht Beschädigt..',
        weapon_broken_need_repair = 'Diese Waffe ist kaputt Repariere sie bevor du sie erneut nutzen kannst.',
        attachment_already_on_weapon = 'Du hast %{value} bereits auf deiner Waffe.'
    },
    success = {
        reloaded = 'Nachgeladen'
    },
    info = {
        loading_bullets = 'Lade Kugeln',
        repairshop_not_usable = 'Der Reparaturen Shop ist im moment ~r~NICHT~w~ Nutzbar.',
        weapon_will_repair = 'Deine Waffe wird repariert.',
        take_weapon_back = '[E] - Waffe nehmen',
        repair_weapon_price = '[E] Waffe Reparieren, ~g~$%{value}~w~',
        removed_attachment = 'Du hast %{value} von deiner Waffe Entfernt!',
        hp_of_weapon = 'Haltbarkeit der Waffe'
    },
    mail = {
        sender = 'Tyrone',
        subject = 'Reparatur',
        message = 'Dein %{value} ist repariert hole ihn an der Position ab. <br><br> Peace out madafaka'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
