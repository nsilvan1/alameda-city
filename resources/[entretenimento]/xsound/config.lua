config = {}

-- depois que a posição do jogador é atualizada ?
config.RefreshTime = 100

-- formato de som padrão para interagir
config.interact_sound_file = "ogg"

-- o emulador está habilitado?
config.interact_sound_enable = false

-- o quanto o player deve estar próximo do som antes de iniciar a atualização da posição?
config.distanceBeforeUpdatingPos = 40

-- Message list
config.Messages = {
    ["streamer_on"]  = "O modo STREAMER está ativado. A partir de agora, você não ouvirá nenhuma música.",
    ["streamer_off"] = "O modo STREAMER está desativado. A partir de agora, você poderá ouvir músicas que os jogadores reproduzirem.",

    ["no_permission"] = "Você não pode usar este comando, você não tem permissão para ele!",
}

-- Addon list
-- True/False enabled/disabled
config.AddonList = {
    crewPhone = false,
}