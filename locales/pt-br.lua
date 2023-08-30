local Translations = {
    error = {
        canceled = 'Cancelado',
        max_ammo = 'Capacidade máxima de munição',
        no_weapon = 'Você não possui nenhuma arma.',
        no_support_attachment = 'Esta arma não suporta este acessório.',
        no_weapon_in_hand = 'Você não tem uma arma em mãos.',
        weapon_broken = 'Esta arma está quebrada e não pode ser usada.',
        no_damage_on_weapon = 'Esta arma não está danificada.',
        weapon_broken_need_repair = 'Sua arma está quebrada, você precisa consertá-la antes de poder usá-la novamente.',
        attachment_already_on_weapon = 'Você já tem um(a) %{value} em sua arma.'
    },
    success = {
        reloaded = 'Recarregado'
    },
    info = {
        loading_bullets = 'Carregando Balas',
        repairshop_not_usable = 'A oficina de reparos neste momento não está ~r~DISPONÍVEL~w~.',
        weapon_will_repair = 'Sua arma será consertada.',
        take_weapon_back = '[E] - Pegar a Arma de Volta',
        repair_weapon_price = '[E] Consertar Arma, ~g~$%{value}~w~',
        removed_attachment = 'Você removeu %{value} de sua arma!',
        hp_of_weapon = 'Durabilidade de sua arma'
    },
    mail = {
        sender = 'Tyrone',
        subject = 'Reparo',
        message = 'Sua %{value} foi consertada e você pode pegá-la no local. <br><br> Até logo, camarada.'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
