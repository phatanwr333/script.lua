function FakeDamage(Damage)
    local DamageModule = require(game:GetService("ReplicatedStorage").Effect.Container.Misc.Damage)
    local old = DamageModule.Run
    DamageModule.Run = function(...)
        args = {...}
        if Damage then
            args[1]['Value'] = Damage
        end
        return old(unpack(args))
    end
end
