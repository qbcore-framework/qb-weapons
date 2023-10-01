local Translations = {
    error = {
        canceled = 'Cancelado',
        max_ammo = 'Capacidade de munição máxima',
        no_weapon = 'Você não tem arma.',
        no_support_attachment = 'Esta arma não suporta este acessório.',
        no_weapon_in_hand = 'Você não está segurando uma arma.',
        weapon_broken = 'Esta arma está quebrada e não pode ser usada.',
        no_damage_on_weapon = 'Esta arma não está danificada.',
        weapon_broken_need_repair = 'Sua arma está quebrada, você precisa consertá-la antes de usá-la novamente.',
        attachment_already_on_weapon = 'Você já tem um(a) %{value} em sua arma.'
    },
    success = {
        reloaded = 'Recarregado'
    },
    info = {
        loading_bullets = 'Carregando Balas',
        repairshop_not_usable = 'A oficina de reparos não está disponível neste momento.',
        weapon_will_repair = 'Sua arma será consertada.',
        take_weapon_back = '[E] - Pegar Arma de Volta',
        repair_weapon_price = '[E] Reparar Arma, ~g~$%{value}~w~',
        removed_attachment = 'Você removeu %{value} da sua arma!',
        hp_of_weapon = 'Durabilidade da sua arma'
    },
    mail = {
        sender = 'Tyrone',
        subject = 'Reparo',
        message = 'Sua %{value} foi reparada e você pode pegá-la no local. <br><br> Fique tranquilo, mano!'
    },
}

if GetConvar('qb_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
